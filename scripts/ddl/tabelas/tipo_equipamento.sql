CREATE TABLE tipo_equipamento (
    id_tipo_equipamento INT PRIMARY KEY IDENTITY(1,1),
    nome_tipo VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);
GO