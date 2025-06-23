DROP TRIGGER IF EXISTS trg_valida_data_fim_locacao;
GO

CREATE TRIGGER trg_valida_data_fim_locacao
ON locacao
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Verifica registros com status 'Finalizada' ou 'Cancelada' mas com data_fim nula
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE status IN ('Finalizada', 'Cancelada')
        AND data_fim IS NULL
    )
    BEGIN
        THROW 50000, 'Data fim deve estar preenchida para status Finalizada ou Cancelada.', 1;
    END;

    -- Verifica registros com status 'Ativa' mas com data_fim preenchida
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE status = 'Ativa'
        AND data_fim IS NOT NULL
    )
    BEGIN
        THROW 50000, 'Data fim deve ser nula para status Ativa.', 1;
    END;
END;
GO



-- Exemplo que DISPARA o trigger 
INSERT INTO locacao (
    id_cliente, id_funcionario, id_agente,
    data_inicio, data_fim, status, observacoes, criado_em
)
VALUES (
    1, 1, 1,
    GETDATE(), NULL, 'Finalizada', 'Teste com erro', GETDATE()
); -- Msg 50000, Nível 16, Estado 1, Data fim deve estar preenchida para status finalizada ou cancelada e nula para status ativa.



/*
JUSTIFICATIVA: 

Essa trigger foi criada para garantir a consistência entre o status da locação e o preenchimento da data de término (data_fim). 
No sistema de alocação de equipamentos, é essencial que:

- Quando uma locação for finalizada ou cancelada, a data_fim esteja preenchida;
- Quando a locação estiver ativa, a data_fim ainda deve estar em branco (NULL).

A trigger impede que registros inconsistentes sejam inseridos ou atualizados no banco, evitando erros em relatórios, 
faturamento e controle de disponibilidade de equipamentos.
*/ 