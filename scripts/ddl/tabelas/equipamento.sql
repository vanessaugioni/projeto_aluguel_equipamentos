CREATE TABLE equipamento (
    id_equipamento INT PRIMARY KEY IDENTITY(1,1),
    nome_equipamento VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    numero_serie VARCHAR(50) NOT NULL UNIQUE,
    status VARCHAR(20) NOT NULL DEFAULT 'Disponível',
    id_tipo_equipamento INT NOT NULL FOREIGN KEY REFERENCES tipo_equipamento(id_tipo_equipamento),
    criado_em DATETIME DEFAULT GETDATE(),
    CONSTRAINT chk_status_equipamento CHECK (status IN ('Disponível', 'Indisponível'))
);
GO