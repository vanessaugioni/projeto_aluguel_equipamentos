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
