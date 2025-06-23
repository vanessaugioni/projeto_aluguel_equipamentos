CREATE NONCLUSTERED INDEX idx_locacao_id_cliente ON locacao(id_cliente);
CREATE NONCLUSTERED INDEX idx_locacao_id_funcionario ON locacao(id_funcionario);
CREATE NONCLUSTERED INDEX idx_locacao_status_datafim ON locacao(status, data_fim);

