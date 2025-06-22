CREATE TABLE item_locacao (
    id_item_locacao INT PRIMARY KEY IDENTITY(1,1),
    id_locacao INT NOT NULL,
    id_equipamento INT NOT NULL,
    data_retirada DATETIME,
    data_devolucao DATETIME,
    condicao_retirada VARCHAR(255),
    condicao_devolucao VARCHAR(255),
    FOREIGN KEY (id_locacao) REFERENCES locacao(id_locacao),
    FOREIGN KEY (id_equipamento) REFERENCES equipamento(id_equipamento)
);