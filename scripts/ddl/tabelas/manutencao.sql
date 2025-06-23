CREATE TABLE manutencao (
    id_manutencao INT PRIMARY KEY IDENTITY(1,1),
    id_equipamento INT NOT NULL FOREIGN KEY REFERENCES equipamento(id_equipamento),
    id_agente INT NOT NULL FOREIGN KEY REFERENCES agente(id_agente),
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME,
    descricao VARCHAR(255),
    tipo VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT chk_status_manutencao CHECK (status IN ('Pendente', 'Concluída', 'Cancelada'))
);
GO
