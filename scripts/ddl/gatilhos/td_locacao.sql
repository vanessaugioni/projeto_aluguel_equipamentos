DROP TRIGGER IF EXISTS trg_locacao_data_fim_valida
GO

CREATE TRIGGER trg_locacao_data_fim_valida
ON locacao
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted
        WHERE (status IN ('finalizada', 'cancelada') AND data_fim IS NULL)
           OR (status = 'ativa' AND data_fim IS NOT NULL)
    )
    BEGIN
        RAISERROR('Data fim deve estar preenchida para status finalizada ou cancelada e nula para status ativa.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END
GO


-- Exemplo que DISPARA o trigger 
UPDATE locacao
SET 
    status = 'finalizada',
    data_fim = NULL
WHERE id_locacao = 1;  -- ID de uma alocação ativa com data_fim = null



/*
JUSTIFICATIVA: 

Essa trigger foi criada para garantir a consistência entre o status da locação e o preenchimento da data de término (data_fim). 
No sistema de alocação de equipamentos, é essencial que:

- Quando uma locação for finalizada ou cancelada, a data_fim esteja preenchida;
- Quando a locação estiver ativa, a data_fim ainda deve estar em branco (NULL).

A trigger impede que registros inconsistentes sejam inseridos ou atualizados no banco, evitando erros em relatórios, 
faturamento e controle de disponibilidade de equipamentos.
*/ 