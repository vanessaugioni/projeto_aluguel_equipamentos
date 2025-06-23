-- ======================================
-- 1. Tabelas
-- ======================================

DROP TABLE IF EXISTS item_locacao;
DROP TABLE IF EXISTS manutencao;
DROP TABLE IF EXISTS locacao;
DROP TABLE IF EXISTS equipamento;
DROP TABLE IF EXISTS funcionario_cliente;
DROP TABLE IF EXISTS agente;
DROP TABLE IF EXISTS tipo_equipamento;
DROP TABLE IF EXISTS cliente;
GO

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nome_cliente VARCHAR(100) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefone CHAR(11),
    criado_em DATETIME
);
GO

CREATE TABLE funcionario_cliente (
    id_funcionario INT PRIMARY KEY IDENTITY(1,1),
    nome_funcionario VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefone CHAR(11),
    cargo VARCHAR(50),
    id_cliente INT NOT NULL FOREIGN KEY REFERENCES cliente(id_cliente)
);
GO

CREATE TABLE agente (
    id_agente INT PRIMARY KEY IDENTITY(1,1),
    nome_agente VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefone CHAR(11),
    cargo VARCHAR(50),
    criado_em DATETIME
);
GO

CREATE TABLE tipo_equipamento (
    id_tipo_equipamento INT PRIMARY KEY IDENTITY(1,1),
    nome_tipo VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);
GO

CREATE TABLE equipamento (
    id_equipamento INT PRIMARY KEY IDENTITY(1,1),
    nome_equipamento VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    numero_serie VARCHAR(50) NOT NULL UNIQUE,
    status VARCHAR(20) NOT NULL DEFAULT 'Disponível',
    id_tipo_equipamento INT NOT NULL FOREIGN KEY REFERENCES tipo_equipamento(id_tipo_equipamento),
    criado_em DATETIME DEFAULT GETDATE(),
    CONSTRAINT chk_status_equipamento CHECK (status IN ('Disponível', 'Indisponível'))
);
GO


CREATE TABLE locacao (
    id_locacao INT PRIMARY KEY IDENTITY(1,1),
    id_cliente INT NOT NULL FOREIGN KEY REFERENCES cliente(id_cliente),
    id_funcionario INT NOT NULL FOREIGN KEY REFERENCES funcionario_cliente(id_funcionario),
    id_agente INT NOT NULL FOREIGN KEY REFERENCES agente(id_agente),
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME,
    status VARCHAR(20) NOT NULL,
    observacoes VARCHAR(255),
    criado_em DATETIME,
    CONSTRAINT chk_status_locacao CHECK (status IN ('Ativa', 'Finalizada', 'Cancelada'))
);
GO


CREATE TABLE item_locacao (
    id_item_locacao INT PRIMARY KEY IDENTITY(1,1),
    id_locacao INT NOT NULL FOREIGN KEY REFERENCES locacao(id_locacao),
    id_equipamento INT NOT NULL FOREIGN KEY REFERENCES equipamento(id_equipamento),
    data_retirada DATETIME,
    data_devolucao DATETIME,
    condicao_retirada VARCHAR(255),
    condicao_devolucao VARCHAR(255)
);
GO

CREATE TABLE manutencao (
    id_manutencao INT PRIMARY KEY IDENTITY(1,1),
    id_equipamento INT NOT NULL FOREIGN KEY REFERENCES equipamento(id_equipamento),
    id_agente INT NOT NULL FOREIGN KEY REFERENCES agente(id_agente),
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME,
    descricao VARCHAR(255),
    tipo VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT chk_status_manutencao CHECK (status IN ('Aberta', 'Pendente', 'Concluída'))
);
GO


-- ======================================
-- 2. Índices (não únicos)
-- ======================================

CREATE INDEX idx_agente_email ON agente(email);
CREATE INDEX idx_cliente_email ON cliente(email);
CREATE INDEX idx_cliente_cnpj ON cliente(cnpj);
CREATE INDEX idx_equipamento_numero_serie ON equipamento(numero_serie);
CREATE INDEX idx_equipamento_id_tipo ON equipamento(id_tipo_equipamento);
CREATE INDEX idx_funcionario_cliente_email ON funcionario_cliente(email);
CREATE INDEX idx_funcionario_cliente_id_cliente ON funcionario_cliente(id_cliente);
CREATE INDEX idx_item_locacao_id_locacao ON item_locacao(id_locacao);
CREATE INDEX idx_item_locacao_id_equipamento ON item_locacao(id_equipamento);
CREATE INDEX idx_locacao_id_cliente ON locacao(id_cliente);
CREATE INDEX idx_locacao_id_funcionario ON locacao(id_funcionario);
CREATE INDEX idx_locacao_id_agente ON locacao(id_agente);
CREATE INDEX idx_manutencao_id_equipamento ON manutencao(id_equipamento);
CREATE INDEX idx_manutencao_id_agente ON manutencao(id_agente);
GO

CREATE NONCLUSTERED INDEX idx_locacao_id_cliente ON locacao(id_cliente);
CREATE NONCLUSTERED INDEX idx_locacao_status_datafim ON locacao(status, data_fim);

CREATE NONCLUSTERED INDEX idx_item_locacao_id_equipamento ON item_locacao(id_equipamento);
CREATE NONCLUSTERED INDEX idx_item_locacao_datas ON item_locacao(data_retirada, data_devolucao);

CREATE NONCLUSTERED INDEX idx_locacao_id_locacao_status ON locacao(id_locacao, status);

CREATE NONCLUSTERED INDEX idx_equipamento_tipo ON equipamento(id_tipo_equipamento);

CREATE NONCLUSTERED INDEX idx_manutencao_id_equipamento ON manutencao(id_equipamento);
CREATE NONCLUSTERED INDEX idx_manutencao_status ON manutencao(status);

CREATE NONCLUSTERED INDEX idx_funcionario_cliente_id_cliente ON funcionario_cliente(id_cliente);

CREATE NONCLUSTERED INDEX idx_locacao_data_inicio ON locacao(data_inicio);
CREATE NONCLUSTERED INDEX idx_manutencao_data_inicio ON manutencao(data_inicio);

-- ======================================
-- 3. Função
-- ======================================

DROP FUNCTION IF EXISTS fn_total_locacoes_por_cliente;
GO

CREATE FUNCTION fn_total_locacoes_por_cliente (
    @id_cliente INT
)
RETURNS INT
AS
BEGIN
    DECLARE @total INT;

    SELECT @total = COUNT(*)
    FROM locacao
    WHERE id_cliente = @id_cliente;

    RETURN @total;
END;
GO

-- ======================================
-- 4. Gatilho
-- ======================================

DROP TRIGGER IF EXISTS trg_locacao_data_fim_valida
GO

CREATE TRIGGER trg_locacao_data_fim_valida
ON locacao
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted
        WHERE (status IN ('Finalizada', 'Cancelada') AND data_fim IS NULL)
           OR (status = 'Ativa' AND data_fim IS NOT NULL)
    )
    BEGIN
        RAISERROR('Data fim deve estar preenchida para status finalizada ou cancelada e nula para status ativa.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END
GO


-- ======================================
-- 5. Procedimentos Armazenados
-- ======================================

DROP PROCEDURE IF EXISTS sp_disponibilidade_equipamento;
GO

CREATE PROCEDURE sp_disponibilidade_equipamento
    @id_equipamento INT,
    @data_inicio DATETIME,
    @data_fim DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM item_locacao il
        INNER JOIN locacao l ON l.id_locacao = il.id_locacao
        WHERE il.id_equipamento = @id_equipamento
          AND l.status = 'Ativa'
          AND (
              (@data_inicio BETWEEN il.data_retirada AND ISNULL(il.data_devolucao, GETDATE())) OR
              (@data_fim BETWEEN il.data_retirada AND ISNULL(il.data_devolucao, GETDATE())) OR
              (il.data_retirada BETWEEN @data_inicio AND @data_fim)
          )
    )
    BEGIN
        PRINT 'Equipamento indisponível no período informado.';
    END
    ELSE
    BEGIN
        PRINT 'Equipamento disponível.';
    END
END;
GO

