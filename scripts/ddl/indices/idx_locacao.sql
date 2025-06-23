CREATE NONCLUSTERED INDEX idx_locacao_id_cliente ON locacao(id_cliente);
CREATE NONCLUSTERED INDEXidx_locacao_id_funcionario ON locacao(id_funcionario);
CREATE NONCLUSTERED INDEX idx_locacao_cliente ON locacao(id_locacao, id_cliente);
