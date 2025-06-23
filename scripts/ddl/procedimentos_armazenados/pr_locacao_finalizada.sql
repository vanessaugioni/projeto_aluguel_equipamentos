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


-- Exemplo para DISPARAR a validação 
EXEC sp_disponibilidade_equipamento 
    @id_equipamento = 1, 
    @data_inicio = '2025-07-01', 
    @data_fim = '2025-07-10'; -- Retorno testado "Equipamento disponível."


/*
JUSTIFICATIVA: 

Essa validação foi desenvolcida para verificar se um equipamento está disponível para locação em determinada data ou período.
Isso é extremamente útil no momento da criação de uma locação, evitando conflito de agendamentos.

Essa em tese não precisa, mas como consegui fazer funcionar deixei aqui. 
*/ 


-- Essa é a pergunta 01 (Vanessa). 

CREATE OR ALTER PROCEDURE sp_ranking_manutencao_clientes
AS
BEGIN
    SET NOCOUNT ON;

    WITH manut_recentes AS (
        SELECT 
            c.cnpj,
            c.nome_cliente,
            m.id_manutencao,
            m.status
        FROM manutencao m
        JOIN equipamento e ON m.id_equipamento = e.id_equipamento
        JOIN item_locacao il ON il.id_equipamento = e.id_equipamento
        JOIN locacao l ON l.id_locacao = il.id_locacao
        JOIN cliente c ON l.id_cliente = c.id_cliente
        WHERE m.data_inicio >= DATEADD(MONTH, -6, GETDATE())
    ),
    contagem_manut AS (
        SELECT
            cnpj,
            nome_cliente,
            COUNT(*) AS total_manut_abertas,
            SUM(CASE WHEN status NOT IN ('Concluída', 'Cancelada') THEN 1 ELSE 0 END) AS manut_pendentes
        FROM manut_recentes
        GROUP BY cnpj, nome_cliente
    )
    SELECT TOP 3
        cnpj AS CNPJ_Empresa,
        nome_cliente AS Nome_Empresa,
        total_manut_abertas AS Total_Manutencoes_6M,
        manut_pendentes AS Manutencoes_Pendentes
    FROM contagem_manut
    ORDER BY total_manut_abertas DESC;
END;
GO

EXEC sp_ranking_manutencao_clientes;

CREATE NONCLUSTERED INDEX idx_manutencao_data_idequipamento ON manutencao (data_inicio, id_equipamento);
CREATE NONCLUSTERED INDEX idx_itemlocacao_idequipamento ON item_locacao (id_equipamento);
CREATE NONCLUSTERED INDEX idx_locacao_idcliente ON locacao (id_cliente);
