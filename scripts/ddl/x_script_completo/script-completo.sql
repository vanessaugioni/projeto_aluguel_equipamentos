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
    CONSTRAINT chk_status_manutencao CHECK (status IN ('Pendente', 'Concluída', 'Cancelada'))
);
GO


-- ======================================
-- 2. Índices (não únicos)
-- ======================================

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

DROP FUNCTION IF EXISTS fn_total_locacoes_por_cliente_com_nome;
GO

CREATE FUNCTION fn_total_locacoes_por_cliente_com_nome(
    @id_cliente INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        c.id_cliente,
        c.nome_cliente,
        COUNT(l.id_locacao) AS total_locacoes
    FROM cliente c
    LEFT JOIN locacao l ON l.id_cliente = c.id_cliente
    WHERE c.id_cliente = @id_cliente
    GROUP BY c.id_cliente, c.nome_cliente
);
GO


-- ======================================
-- 4. Gatilho
-- ======================================

DROP TRIGGER IF EXISTS trg_valida_data_fim_locacao;
GO

CREATE TRIGGER trg_valida_data_fim_locacao
ON locacao
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE status IN ('Finalizada', 'Cancelada')
        AND data_fim IS NULL
    )
    BEGIN
        THROW 50000, 'Data fim deve estar preenchida para status Finalizada ou Cancelada.', 1;
    END;
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE status = 'Ativa'
        AND data_fim IS NOT NULL
    )
    BEGIN
        THROW 50000, 'Data fim deve ser nula para status Ativa.', 1;
    END;
END;
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
          AND l.status = 'ativa'
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

