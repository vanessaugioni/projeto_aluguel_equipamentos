-- Perguntas sobre a regra de negócio 

/*
1. Pergunta: Qual é o ranking das 3 empresas que mais abriram manutenções nos últimos 6 meses, mostrando para cada uma a quantidade 
             total de manutenções realizadas e a quantidade atual de manutenções pendentes?

Aluno(a): Vanessa Ugioni
*/

-- Código com Stored Procedure
-- Plano de Execução - Atalho (ctrl + M)

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

/*
1. Plano de Acesso utilizado:

- A consulta usa predominantemente o operador Index Seek nos índices criados.
- Por exemplo, o índice idx_manutencao_data_idequipamento é utilizado para filtrar rapidamente as 
manutenções dos últimos 6 meses pela coluna data_inicio e para buscar por id_equipamento.

2. Operadores usados:

- Index Seek: Busca eficiente em índices não clusterizados para filtrar por data e fazer junções.
- Nested Loops: Utilizado para realizar os joins entre tabelas (ex: entre manutencao e equipamento).
- Hash Match: Usado para agregações e operações de agrupamento na CTE.

3. Chaves dos índices utilizados:
- Para o índice idx_manutencao_data_idequipamento — as chaves usadas são as colunas (data_inicio, id_equipamento).
- Para idx_itemlocacao_idequipamento — a chave usada é id_equipamento.
- Para idx_locacao_idcliente — a chave usada é id_cliente.
*/



-- Indices essenciais:
-- Índice 1: manutencao (data_inicio, id_equipamento)
CREATE NONCLUSTERED INDEX idx_manutencao_data_idequipamento 
ON manutencao (data_inicio, id_equipamento);
-- Justificativa:
-- Este índice melhora o desempenho do filtro por data de início nas manutenções (últimos 6 meses)
-- e otimiza o join com a tabela equipamento por id_equipamento.

-- Índice 2: item_locacao (id_equipamento)
CREATE NONCLUSTERED INDEX idx_itemlocacao_idequipamento 
ON item_locacao (id_equipamento);
-- Justificativa:
-- Permite que o SQL Server localize rapidamente todos os registros de locação
-- de um equipamento específico, melhorando o desempenho do join com a tabela equipamento.

-- Índice 3: locacao (id_cliente)
CREATE NONCLUSTERED INDEX idx_locacao_idcliente 
ON locacao (id_cliente);
-- Justificativa:
-- Otimiza o join com a tabela cliente para obter o CNPJ e nome da empresa.
-- Também acelera agrupamentos e filtros por cliente em consultas analíticas.




/*
2 . Pergunta: Quais são os 5 equipamentos com maior número de locações no último ano, mostrando quantas 
vezes foram alugados e em quantas locações diferentes apareceram?

Aluno(a): Sabrina Lorenzon Bettiol
*/
WITH locacoes_recentes AS (
    SELECT
        il.id_equipamento,
        COUNT(*) AS total_vezes_alugado,
        COUNT(DISTINCT il.id_locacao) AS total_locacoes_diferentes
    FROM item_locacao il
    JOIN locacao l ON il.id_locacao = l.id_locacao
    WHERE l.data_inicio >= DATEADD(YEAR, -1, GETDATE())
    GROUP BY il.id_equipamento
)
SELECT TOP 5
    e.nome_equipamento,
    lr.total_vezes_alugado,
    lr.total_locacoes_diferentes
FROM locacoes_recentes lr
JOIN equipamento e ON lr.id_equipamento = e.id_equipamento
ORDER BY lr.total_vezes_alugado DESC;

-- Indices essenciais:
CREATE NONCLUSTERED INDEX idx_itemlocacao_idequipamento ON item_locacao(id_equipamento);
CREATE NONCLUSTERED INDEX idx_itemlocacao_idlocacao ON item_locacao(id_locacao);
CREATE NONCLUSTERED INDEX idx_locacao_datainicio ON locacao(data_inicio);

/*
Índices utilizados:
idx_locacao_datainicio = para filtrar o último ano
idx_itemlocacao_idlocacao = JOIN entre item_locacao e locacao
idx_itemlocacao_idequipamento = GROUP BY em equipamentoto

Operadores principais:
Index Seek em locacao.data_inicio
Nested Loop Join entre item_locacao e locacao
Hash Match para agrupamento e contagem

Chaves de acesso:
item_locacao.id_equipamento
item_locacao.id_locacao
locacao.data_inicio
*/

/*
3 . Pergunta: Qual é o tempo médio (em dias) entre a devolução de um equipamento e o início da sua próxima manutenção corretiva?
*/
WITH devolucoes_e_manutencoes AS (
    SELECT
        il.id_equipamento,
        il.data_devolucao,
        m.data_inicio,
        DATEDIFF(DAY, il.data_devolucao, m.data_inicio) AS dias_entre
    FROM item_locacao il
    JOIN manutencao m ON il.id_equipamento = m.id_equipamento
    WHERE 
        il.data_devolucao IS NOT NULL
        AND m.tipo = 'corretiva'
        AND m.data_inicio > il.data_devolucao
)
SELECT 
    ROUND(AVG(CAST(dias_entre AS FLOAT)), 2) AS media_dias_entre_devolucao_e_manutencao
FROM devolucoes_e_manutencoes
WHERE dias_entre BETWEEN 0 AND 60;
-- Indices essenciais:
CREATE NONCLUSTERED INDEX idx_itemlocacao_idequipamento_devolucao
  ON item_locacao(id_equipamento, data_devolucao);

CREATE NONCLUSTERED INDEX idx_manutencao_idequipamento_datainicio_tipo
  ON manutencao(id_equipamento, data_inicio)
  INCLUDE (tipo);

/*
Índices utilizados:
idx_itemlocacao_idequipamento_devolucao
idx_manutencao_idequipamento_datainicio_tipo

Chaves de acesso:
item_locacao.id_equipamento
manutencao.id_equipamento
manutencao.tipo

Operadores:
Index Seek nos dois índices
Nested Loops para cruzamento dos equipamentos
Compute Scalar para cálculo do DATEDIFF e média
*/
