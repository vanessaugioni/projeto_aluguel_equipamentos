CREATE TABLE locacao (
    id_locacao INT PRIMARY KEY IDENTITY(1,1),
    id_cliente INT NOT NULL FOREIGN KEY REFERENCES cliente(id_cliente),
    id_funcionario INT NOT NULL FOREIGN KEY REFERENCES funcionario_cliente(id_funcionario),
    id_agente INT NOT NULL FOREIGN KEY REFERENCES agente(id_agente),
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME,
    status VARCHAR(20) NOT NULL,
    observacoes VARCHAR(255),
    criado_em DATETIME,
    CONSTRAINT chk_status_locacao CHECK (status IN ('Ativa', 'Finalizada', 'Cancelada'))
);
GO