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
