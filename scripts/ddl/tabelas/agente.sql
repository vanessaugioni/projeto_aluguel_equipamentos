CREATE TABLE agente (
    id_agente INT PRIMARY KEY IDENTITY(1,1),
    nome_agente VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefone CHAR(11),
    cargo VARCHAR(50),
    criado_em DATETIME
);
GO
