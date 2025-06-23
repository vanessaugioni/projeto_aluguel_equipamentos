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


-- Consulta para saber o total de locações de um cliente específico
SELECT * FROM fn_total_locacoes_por_cliente_com_nome(5);

/*
JUSTIFICATIVA: 

A função fn_total_locacoes_por_cliente_com_nome foi criada para retornar o total de locações feitas por um cliente específico. 
Essa função é útil para consultas rápidas e relatórios de uso, permitindo identificar quantas vezes um cliente utilizou nosso serviço de alocação de equipamentos.

Dentre outras possibilidades: 
- Gerar relatórios de frequência de locações, sem duplicar código nas consultas;
- Saber quantos alocações para os funcionário o cliente (empresa) possui; 
- Uso na criação de paines rápidos; 
- Agilizar a análise de dados, já que encapsula a contagem diretamente no banco.
*/