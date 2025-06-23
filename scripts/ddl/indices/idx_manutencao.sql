CREATE NONCLUSTERED INDEX idx_manutencao_data_idequipamento ON manutencao (data_inicio, id_equipamento);
CREATE NONCLUSTERED INDEX idx_manutencao_status ON manutencao(status);