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


-- Consulta para saber o total de locações de um cliente específico
SELECT dbo.fn_total_locacoes_por_cliente(3) AS total_locacoes;
SELECT dbo.fn_total_locacoes_por_cliente(5) AS total_locacoes;


/*
Justificativa da escolha 

A função fn_total_locacoes_por_cliente foi criada para retornar o total de locações feitas por um cliente específico. 
Essa função é útil para consultas rápidas e relatórios de uso, permitindo identificar quantas vezes um cliente utilizou nosso serviço de alocação de equipamentos.

Dentre outras possibilidades: 
- Gerar relatórios de frequência de locações, sem duplicar código nas consultas;
- Saber quantos alocações para os funcionário o cliente (empresa) possui; 
- Uso na criação de paines rápidos; 
- Agilizar a análise de dados, já que encapsula a contagem diretamente no banco.
*/