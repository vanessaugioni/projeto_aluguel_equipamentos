DROP PROCEDURE IF EXISTS sp_finalizar_locacao;
GO

CREATE PROCEDURE sp_finalizar_locacao
    @id_locacao INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 FROM locacao
        WHERE id_locacao = @id_locacao AND status = 'ativa'
    )
    BEGIN
        UPDATE locacao
        SET 
            status = 'finalizada',
            data_fim = GETDATE()
        WHERE id_locacao = @id_locacao;

        PRINT 'Locação finalizada com sucesso.';
    END
    ELSE
    BEGIN
        PRINT 'Locação não encontrada ou já finalizada.';
    END
END;
GO