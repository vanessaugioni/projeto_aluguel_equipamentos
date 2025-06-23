CREATE NONCLUSTERED INDEX idx_item_locacao_id_locacao ON item_locacao(id_locacao);
CREATE NONCLUSTERED INDEX idx_item_locacao_id_equipamento ON item_locacao(id_equipamento);
CREATE NONCLUSTERED INDEX idx_item_locacao_datas ON item_locacao(data_retirada, data_devolucao);