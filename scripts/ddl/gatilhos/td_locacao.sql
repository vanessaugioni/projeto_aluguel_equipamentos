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

Essa trigger garante a coerência e a integridade das informações operacionais relacionadas ao ciclo de vida das locações de equipamentos. 
No contexto da empresa, onde os equipamentos são entregues, utilizados e devolvidos sob demanda, é essencial que o sistema refita corretamente o status real de cada locação.

Ao impedir inconsistências como:

- Locações encerradas sem data de término, ou
- Locações ativas com data de término definida,

Se a locação está com status 'Finalizada' ou 'Cancelada', o campo data_fim não pode ser nulo.
- Justificativa: significa que a locação foi encerrada e, portanto, a data de término deve estar registrada.

Se a locação está com status 'Ativa', o campo data_fim deve ser nulo.
- Justificativa: a locação ainda está em andamento, então não faz sentido já haver uma data de término.
*/ 