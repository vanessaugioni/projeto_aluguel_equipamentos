-- Perguntas sobre a regra de negócio 

/*
1. Pergunta: Qual é o ranking das 3 empresas que mais abriram manutenções nos últimos 6 meses, mostrando para cada uma a quantidade 
             total de manutenções realizadas e a quantidade atual de manutenções pendentes?

Aluno(a): Vanessa Ugioni
*/

-- Código do select 

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
        SUM(CASE WHEN status NOT IN ('finalizada', 'cancelada') THEN 1 ELSE 0 END) AS manut_pendentes
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

-- Indices essenciais
CREATE NONCLUSTERED INDEX idx_manutencao_data_idequipamento ON manutencao (data_inicio, id_equipamento);
CREATE NONCLUSTERED INDEX idx_itemlocacao_idequipamento ON item_locacao (id_equipamento);
CREATE NONCLUSTERED INDEX idx_locacao_idcliente ON locacao (id_cliente);

