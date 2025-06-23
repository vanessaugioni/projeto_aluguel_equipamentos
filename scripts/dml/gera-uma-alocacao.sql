INSERT INTO locacao (
    id_cliente, id_funcionario, id_agente,
    data_inicio, data_fim, status,
    observacoes, criado_em
)
VALUES (
    1, 1, 1,                      -- IDs válidos existentes
    GETDATE(), NULL,             -- data_fim = NULL pois status é 'Ativa'
    'Ativa',
    'Locação simples de teste',
    GETDATE()
);
