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
*/ 
