-- Populando cliente
SET IDENTITY_INSERT cliente ON
GO
INSERT cliente (id_cliente, nome_cliente, cnpj, email, telefone, criado_em) VALUES (1, 'Cliente 1', '12345678000101', 'cliente1@email.com', '11999999991', GETDATE())
GO
INSERT cliente (id_cliente, nome_cliente, cnpj, email, telefone, criado_em) VALUES (2, 'Cliente 2', '12345678000102', 'cliente2@email.com', '11999999992', GETDATE())
GO
INSERT cliente (id_cliente, nome_cliente, cnpj, email, telefone, criado_em) VALUES (3, 'Cliente 3', '12345678000103', 'cliente3@email.com', '11999999993', GETDATE())
GO
INSERT cliente (id_cliente, nome_cliente, cnpj, email, telefone, criado_em) VALUES (4, 'Cliente 4', '12345678000104', 'cliente4@email.com', '11999999994', GETDATE())
GO
INSERT cliente (id_cliente, nome_cliente, cnpj, email, telefone, criado_em) VALUES (5, 'Cliente 5', '12345678000105', 'cliente5@email.com', '11999999995', GETDATE())
GO
INSERT cliente (id_cliente, nome_cliente, cnpj, email, telefone, criado_em) VALUES (6, 'Cliente 6', '12345678000106', 'cliente6@email.com', '11999999996', GETDATE())
GO
INSERT cliente (id_cliente, nome_cliente, cnpj, email, telefone, criado_em) VALUES (7, 'Cliente 7', '12345678000107', 'cliente7@email.com', '11999999997', GETDATE())
GO
INSERT cliente (id_cliente, nome_cliente, cnpj, email, telefone, criado_em) VALUES (8, 'Cliente 8', '12345678000108', 'cliente8@email.com', '11999999998', GETDATE())
GO
INSERT cliente (id_cliente, nome_cliente, cnpj, email, telefone, criado_em) VALUES (9, 'Cliente 9', '12345678000109', 'cliente9@email.com', '11999999999', GETDATE())
GO
INSERT cliente (id_cliente, nome_cliente, cnpj, email, telefone, criado_em) VALUES (10, 'Cliente 10', '12345678000110', 'cliente10@email.com', '11999999888', GETDATE())
GO
INSERT cliente (id_cliente, nome_cliente, cnpj, email, telefone, criado_em) VALUES (11, 'Cliente 11', '12345678000111', 'cliente11@email.com', '11999999887', GETDATE())
GO
SET IDENTITY_INSERT cliente OFF
GO

-- Populando funcionario_cliente
SET IDENTITY_INSERT funcionario_cliente ON
GO
INSERT funcionario_cliente (id_funcionario, nome_funcionario, email, telefone, cargo, id_cliente) VALUES (1, 'Funcionario 1', 'func1@email.com', '11988888881', 'Cargo A', 1)
GO
INSERT funcionario_cliente (id_funcionario, nome_funcionario, email, telefone, cargo, id_cliente) VALUES (2, 'Funcionario 2', 'func2@email.com', '11988888882', 'Cargo B', 2)
GO
INSERT funcionario_cliente (id_funcionario, nome_funcionario, email, telefone, cargo, id_cliente) VALUES (3, 'Funcionario 3', 'func3@email.com', '11988888883', 'Cargo C', 3)
GO
INSERT funcionario_cliente (id_funcionario, nome_funcionario, email, telefone, cargo, id_cliente) VALUES (4, 'Funcionario 4', 'func4@email.com', '11988888884', 'Cargo A', 4)
GO
INSERT funcionario_cliente (id_funcionario, nome_funcionario, email, telefone, cargo, id_cliente) VALUES (5, 'Funcionario 5', 'func5@email.com', '11988888885', 'Cargo B', 5)
GO
INSERT funcionario_cliente (id_funcionario, nome_funcionario, email, telefone, cargo, id_cliente) VALUES (6, 'Funcionario 6', 'func6@email.com', '11988888886', 'Cargo C', 6)
GO
INSERT funcionario_cliente (id_funcionario, nome_funcionario, email, telefone, cargo, id_cliente) VALUES (7, 'Funcionario 7', 'func7@email.com', '11988888887', 'Cargo A', 7)
GO
INSERT funcionario_cliente (id_funcionario, nome_funcionario, email, telefone, cargo, id_cliente) VALUES (8, 'Funcionario 8', 'func8@email.com', '11988888888', 'Cargo B', 8)
GO
INSERT funcionario_cliente (id_funcionario, nome_funcionario, email, telefone, cargo, id_cliente) VALUES (9, 'Funcionario 9', 'func9@email.com', '11988888889', 'Cargo C', 9)
GO
INSERT funcionario_cliente (id_funcionario, nome_funcionario, email, telefone, cargo, id_cliente) VALUES (10, 'Funcionario 10', 'func10@email.com', '11988888880', 'Cargo A', 10)
GO
INSERT funcionario_cliente (id_funcionario, nome_funcionario, email, telefone, cargo, id_cliente) VALUES (11, 'Funcionario 11', 'func11@email.com', '11988888881', 'Cargo B', 11)
GO
SET IDENTITY_INSERT funcionario_cliente OFF
GO

-- Populando tipo_equipamento
SET IDENTITY_INSERT tipo_equipamento ON
GO
INSERT tipo_equipamento (id_tipo_equipamento, nome_tipo, descricao) VALUES (1, 'Tipo A', 'Descrição do Tipo A')
GO
INSERT tipo_equipamento (id_tipo_equipamento, nome_tipo, descricao) VALUES (2, 'Tipo B', 'Descrição do Tipo B')
GO
INSERT tipo_equipamento (id_tipo_equipamento, nome_tipo, descricao) VALUES (3, 'Tipo C', 'Descrição do Tipo C')
GO
INSERT tipo_equipamento (id_tipo_equipamento, nome_tipo, descricao) VALUES (4, 'Tipo D', 'Descrição do Tipo D')
GO
INSERT tipo_equipamento (id_tipo_equipamento, nome_tipo, descricao) VALUES (5, 'Tipo E', 'Descrição do Tipo E')
GO
INSERT tipo_equipamento (id_tipo_equipamento, nome_tipo, descricao) VALUES (6, 'Tipo F', 'Descrição do Tipo F')
GO
INSERT tipo_equipamento (id_tipo_equipamento, nome_tipo, descricao) VALUES (7, 'Tipo G', 'Descrição do Tipo G')
GO
INSERT tipo_equipamento (id_tipo_equipamento, nome_tipo, descricao) VALUES (8, 'Tipo H', 'Descrição do Tipo H')
GO
INSERT tipo_equipamento (id_tipo_equipamento, nome_tipo, descricao) VALUES (9, 'Tipo I', 'Descrição do Tipo I')
GO
INSERT tipo_equipamento (id_tipo_equipamento, nome_tipo, descricao) VALUES (10, 'Tipo J', 'Descrição do Tipo J')
GO
INSERT tipo_equipamento (id_tipo_equipamento, nome_tipo, descricao) VALUES (11, 'Tipo K', 'Descrição do Tipo K')
GO
SET IDENTITY_INSERT tipo_equipamento OFF
GO

-- Populando agente
SET IDENTITY_INSERT agente ON
GO
INSERT agente (id_agente, nome_agente, email, telefone, cargo, criado_em) VALUES (1, 'Agente 1', 'agente1@email.com', '11977777771', 'Tecnico', GETDATE())
GO
INSERT agente (id_agente, nome_agente, email, telefone, cargo, criado_em) VALUES (2, 'Agente 2', 'agente2@email.com', '11977777772', 'Atendente', GETDATE())
GO
INSERT agente (id_agente, nome_agente, email, telefone, cargo, criado_em) VALUES (3, 'Agente 3', 'agente3@email.com', '11977777773', 'Gerente', GETDATE())
GO
INSERT agente (id_agente, nome_agente, email, telefone, cargo, criado_em) VALUES (4, 'Agente 4', 'agente4@email.com', '11977777774', 'Tecnico', GETDATE())
GO
INSERT agente (id_agente, nome_agente, email, telefone, cargo, criado_em) VALUES (5, 'Agente 5', 'agente5@email.com', '11977777775', 'Atendente', GETDATE())
GO
INSERT agente (id_agente, nome_agente, email, telefone, cargo, criado_em) VALUES (6, 'Agente 6', 'agente6@email.com', '11977777776', 'Gerente', GETDATE())
GO
INSERT agente (id_agente, nome_agente, email, telefone, cargo, criado_em) VALUES (7, 'Agente 7', 'agente7@email.com', '11977777777', 'Tecnico', GETDATE())
GO
INSERT agente (id_agente, nome_agente, email, telefone, cargo, criado_em) VALUES (8, 'Agente 8', 'agente8@email.com', '11977777778', 'Atendente', GETDATE())
GO
INSERT agente (id_agente, nome_agente, email, telefone, cargo, criado_em) VALUES (9, 'Agente 9', 'agente9@email.com', '11977777779', 'Gerente', GETDATE())
GO
INSERT agente (id_agente, nome_agente, email, telefone, cargo, criado_em) VALUES (10, 'Agente 10', 'agente10@email.com', '11977777770', 'Tecnico', GETDATE())
GO
INSERT agente (id_agente, nome_agente, email, telefone, cargo, criado_em) VALUES (11, 'Agente 11', 'agente11@email.com', '11977777771', 'Atendente', GETDATE())
GO
SET IDENTITY_INSERT agente OFF
GO

-- Populando equipamento
SET IDENTITY_INSERT equipamento ON
GO
INSERT equipamento (id_equipamento, nome_equipamento, descricao, numero_serie, status, id_tipo_equipamento, criado_em) VALUES (1, 'Equipamento 1', 'Descricao equipamento 1', 'SN00001', 'disponivel', 1, GETDATE())
GO
INSERT equipamento (id_equipamento, nome_equipamento, descricao, numero_serie, status, id_tipo_equipamento, criado_em) VALUES (2, 'Equipamento 2', 'Descricao equipamento 2', 'SN00002', 'disponivel', 2, GETDATE())
GO
INSERT equipamento (id_equipamento, nome_equipamento, descricao, numero_serie, status, id_tipo_equipamento, criado_em) VALUES (3, 'Equipamento 3', 'Descricao equipamento 3', 'SN00003', 'disponivel', 3, GETDATE())
GO
INSERT equipamento (id_equipamento, nome_equipamento, descricao, numero_serie, status, id_tipo_equipamento, criado_em) VALUES (4, 'Equipamento 4', 'Descricao equipamento 4', 'SN00004', 'disponivel', 4, GETDATE())
GO
INSERT equipamento (id_equipamento, nome_equipamento, descricao, numero_serie, status, id_tipo_equipamento, criado_em) VALUES (5, 'Equipamento 5', 'Descricao equipamento 5', 'SN00005', 'disponivel', 5, GETDATE())
GO
INSERT equipamento (id_equipamento, nome_equipamento, descricao, numero_serie, status, id_tipo_equipamento, criado_em) VALUES (6, 'Equipamento 6', 'Descricao equipamento 6', 'SN00006', 'disponivel', 6, GETDATE())
GO
INSERT equipamento (id_equipamento, nome_equipamento, descricao, numero_serie, status, id_tipo_equipamento, criado_em) VALUES (7, 'Equipamento 7', 'Descricao equipamento 7', 'SN00007', 'disponivel', 7, GETDATE())
GO
INSERT equipamento (id_equipamento, nome_equipamento, descricao, numero_serie, status, id_tipo_equipamento, criado_em) VALUES (8, 'Equipamento 8', 'Descricao equipamento 8', 'SN00008', 'disponivel', 8, GETDATE())
GO
INSERT equipamento (id_equipamento, nome_equipamento, descricao, numero_serie, status, id_tipo_equipamento, criado_em) VALUES (9, 'Equipamento 9', 'Descricao equipamento 9', 'SN00009', 'disponivel', 9, GETDATE())
GO
INSERT equipamento (id_equipamento, nome_equipamento, descricao, numero_serie, status, id_tipo_equipamento, criado_em) VALUES (10, 'Equipamento 10', 'Descricao equipamento 10', 'SN00010', 'disponivel', 10, GETDATE())
GO
INSERT equipamento (id_equipamento, nome_equipamento, descricao, numero_serie, status, id_tipo_equipamento, criado_em) VALUES (11, 'Equipamento 11', 'Descricao equipamento 11', 'SN00011', 'disponivel', 11, GETDATE())
GO
SET IDENTITY_INSERT equipamento OFF
GO

-- Populando locacao
SET IDENTITY_INSERT locacao ON
GO
INSERT locacao (id_locacao, id_cliente, id_funcionario, id_agente, data_inicio, data_fim, status, observacoes, criado_em) VALUES (1, 1, 1, 1, GETDATE(), NULL, 'ativa', 'Observacao 1', GETDATE())
GO
INSERT locacao (id_locacao, id_cliente, id_funcionario, id_agente, data_inicio, data_fim, status, observacoes, criado_em) VALUES (2, 2, 2, 2, GETDATE(), NULL, 'ativa', 'Observacao 2', GETDATE())
GO
INSERT locacao (id_locacao, id_cliente, id_funcionario, id_agente, data_inicio, data_fim, status, observacoes, criado_em) VALUES (3, 3, 3, 3, GETDATE(), NULL, 'ativa', 'Observacao 3', GETDATE())
GO
INSERT locacao (id_locacao, id_cliente, id_funcionario, id_agente, data_inicio, data_fim, status, observacoes, criado_em) VALUES (4, 4, 4, 4, GETDATE(), NULL, 'ativa', 'Observacao 4', GETDATE())
GO
INSERT locacao (id_locacao, id_cliente, id_funcionario, id_agente, data_inicio, data_fim, status, observacoes, criado_em) VALUES (5, 5, 5, 5, GETDATE(), NULL, 'ativa', 'Observacao 5', GETDATE())
GO
INSERT locacao (id_locacao, id_cliente, id_funcionario, id_agente, data_inicio, data_fim, status, observacoes, criado_em) VALUES (6, 6, 6, 6, GETDATE(), NULL, 'ativa', 'Observacao 6', GETDATE())
GO
INSERT locacao (id_locacao, id_cliente, id_funcionario, id_agente, data_inicio, data_fim, status, observacoes, criado_em) VALUES (7, 7, 7, 7, GETDATE(), NULL, 'ativa', 'Observacao 7', GETDATE())
GO
INSERT locacao (id_locacao, id_cliente, id_funcionario, id_agente, data_inicio, data_fim, status, observacoes, criado_em) VALUES (8, 8, 8, 8, GETDATE(), NULL, 'ativa', 'Observacao 8', GETDATE())
GO
INSERT locacao (id_locacao, id_cliente, id_funcionario, id_agente, data_inicio, data_fim, status, observacoes, criado_em) VALUES (9, 9, 9, 9, GETDATE(), NULL, 'ativa', 'Observacao 9', GETDATE())
GO
INSERT locacao (id_locacao, id_cliente, id_funcionario, id_agente, data_inicio, data_fim, status, observacoes, criado_em) VALUES (10, 10, 10, 10, GETDATE(), NULL, 'ativa', 'Observacao 10', GETDATE())
GO
INSERT locacao (id_locacao, id_cliente, id_funcionario, id_agente, data_inicio, data_fim, status, observacoes, criado_em) VALUES (11, 11, 11, 11, GETDATE(), NULL, 'ativa', 'Observacao 11', GETDATE())
GO
SET IDENTITY_INSERT locacao OFF
GO

-- Populando item_locacao
SET IDENTITY_INSERT item_locacao ON
GO
INSERT item_locacao (id_item_locacao, id_locacao, id_equipamento, data_retirada, data_devolucao, condicao_retirada, condicao_devolucao) VALUES (1, 1, 1, GETDATE(), NULL, 'Condicao retirada 1', NULL)
GO
INSERT item_locacao (id_item_locacao, id_locacao, id_equipamento, data_retirada, data_devolucao, condicao_retirada, condicao_devolucao) VALUES (2, 2, 2, GETDATE(), NULL, 'Condicao retirada 2', NULL)
GO
INSERT item_locacao (id_item_locacao, id_locacao, id_equipamento, data_retirada, data_devolucao, condicao_retirada, condicao_devolucao) VALUES (3, 3, 3, GETDATE(), NULL, 'Condicao retirada 3', NULL)
GO
INSERT item_locacao (id_item_locacao, id_locacao, id_equipamento, data_retirada, data_devolucao, condicao_retirada, condicao_devolucao) VALUES (4, 4, 4, GETDATE(), NULL, 'Condicao retirada 4', NULL)
GO
INSERT item_locacao (id_item_locacao, id_locacao, id_equipamento, data_retirada, data_devolucao, condicao_retirada, condicao_devolucao) VALUES (5, 5, 5, GETDATE(), NULL, 'Condicao retirada 5', NULL)
GO
INSERT item_locacao (id_item_locacao, id_locacao, id_equipamento, data_retirada, data_devolucao, condicao_retirada, condicao_devolucao) VALUES (6, 6, 6, GETDATE(), NULL, 'Condicao retirada 6', NULL)
GO
INSERT item_locacao (id_item_locacao, id_locacao, id_equipamento, data_retirada, data_devolucao, condicao_retirada, condicao_devolucao) VALUES (7, 7, 7, GETDATE(), NULL, 'Condicao retirada 7', NULL)
GO
INSERT item_locacao (id_item_locacao, id_locacao, id_equipamento, data_retirada, data_devolucao, condicao_retirada, condicao_devolucao) VALUES (8, 8, 8, GETDATE(), NULL, 'Condicao retirada 8', NULL)
GO
INSERT item_locacao (id_item_locacao, id_locacao, id_equipamento, data_retirada, data_devolucao, condicao_retirada, condicao_devolucao) VALUES (9, 9, 9, GETDATE(), NULL, 'Condicao retirada 9', NULL)
GO
INSERT item_locacao (id_item_locacao, id_locacao, id_equipamento, data_retirada, data_devolucao, condicao_retirada, condicao_devolucao) VALUES (10, 10, 10, GETDATE(), NULL, 'Condicao retirada 10', NULL)
GO
INSERT item_locacao (id_item_locacao, id_locacao, id_equipamento, data_retirada, data_devolucao, condicao_retirada, condicao_devolucao) VALUES (11, 11, 11, GETDATE(), NULL, 'Condicao retirada 11', NULL)
GO
SET IDENTITY_INSERT item_locacao OFF
GO

-- Populando manutencao
SET IDENTITY_INSERT manutencao ON
GO
INSERT manutencao (id_manutencao, id_equipamento, id_agente, data_inicio, data_fim, descricao, tipo, status) VALUES (1, 1, 1, GETDATE(), NULL, 'Manutencao 1', 'preventiva', 'pendente')
GO
INSERT manutencao (id_manutencao, id_equipamento, id_agente, data_inicio, data_fim, descricao, tipo, status) VALUES (2, 2, 2, GETDATE(), NULL, 'Manutencao 2', 'corretiva', 'pendente')
GO
INSERT manutencao (id_manutencao, id_equipamento, id_agente, data_inicio, data_fim, descricao, tipo, status) VALUES (3, 3, 3, GETDATE(), NULL, 'Manutencao 3', 'preventiva', 'pendente')
GO
INSERT manutencao (id_manutencao, id_equipamento, id_agente, data_inicio, data_fim, descricao, tipo, status) VALUES (4, 4, 4, GETDATE(), NULL, 'Manutencao 4', 'corretiva', 'pendente')
GO
INSERT manutencao (id_manutencao, id_equipamento, id_agente, data_inicio, data_fim, descricao, tipo, status) VALUES (5, 5, 5, GETDATE(), NULL, 'Manutencao 5', 'preventiva', 'pendente')
GO
INSERT manutencao (id_manutencao, id_equipamento, id_agente, data_inicio, data_fim, descricao, tipo, status) VALUES (6, 6, 6, GETDATE(), NULL, 'Manutencao 6', 'corretiva', 'pendente')
GO
INSERT manutencao (id_manutencao, id_equipamento, id_agente, data_inicio, data_fim, descricao, tipo, status) VALUES (7, 7, 7, GETDATE(), NULL, 'Manutencao 7', 'preventiva', 'pendente')
GO
INSERT manutencao (id_manutencao, id_equipamento, id_agente, data_inicio, data_fim, descricao, tipo, status) VALUES (8, 8, 8, GETDATE(), NULL, 'Manutencao 8', 'corretiva', 'pendente')
GO
INSERT manutencao (id_manutencao, id_equipamento, id_agente, data_inicio, data_fim, descricao, tipo, status) VALUES (9, 9, 9, GETDATE(), NULL, 'Manutencao 9', 'preventiva', 'pendente')
GO
INSERT manutencao (id_manutencao, id_equipamento, id_agente, data_inicio, data_fim, descricao, tipo, status) VALUES (10, 10, 10, GETDATE(), NULL, 'Manutencao 10', 'corretiva', 'pendente')
GO
INSERT manutencao (id_manutencao, id_equipamento, id_agente, data_inicio, data_fim, descricao, tipo, status) VALUES (11, 11, 11, GETDATE(), NULL, 'Manutencao 11', 'preventiva', 'pendente')
GO
SET IDENTITY_INSERT manutencao OFF
GO
