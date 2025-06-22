CREATE TABLE equipamento (
    id_equipamento INT PRIMARY KEY IDENTITY(1,1),
    nome_equipamento VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    numero_serie VARCHAR(50) NOT NULL UNIQUE,
    status VARCHAR(20) NOT NULL,
    id_tipo_equipamento INT NOT NULL,
    criado_em DATETIME,
    FOREIGN KEY (id_tipo_equipamento) REFERENCES tipo_equipamento(id_tipo_equipamento)
);