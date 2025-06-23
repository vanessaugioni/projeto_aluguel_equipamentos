-- Populando cliente
SET IDENTITY_INSERT cliente ON
GO
INSERT cliente (id_cliente, nome_cliente, cnpj, email, telefone, criado_em) VALUES 
(1, 'Tech Solutions LTDA', '12345678000101', 'contato@techsolutionsltda.com', '11951939783', GETDATE()),
(2, 'Construtora Ápice', '12345678000102', 'contato@construtoraapice.com', '11978321457', GETDATE()),
(3, 'Hospital São Lucas', '12345678000103', 'contato@hospitalsaolucas.com', '11962349811', GETDATE()),
(4, 'Universidade Pioneira', '12345678000104', 'contato@universidadepioneira.com', '11945632187', GETDATE()),
(5, 'Distribuidora Alfa', '12345678000105', 'contato@distribuidoraalfa.com', '11980976543', GETDATE()),
(6, 'Clínica Vida', '12345678000106', 'contato@clinicavida.com', '11971564892', GETDATE()),
(7, 'Loja Inova', '12345678000107', 'contato@lojainova.com', '11939485721', GETDATE()),
(8, 'Transportadora Rápida', '12345678000108', 'contato@transportadorarapida.com', '11982736459', GETDATE()),
(9, 'Fazenda Bela Vista', '12345678000109', 'contato@fazendabv.com', '11956473829', GETDATE()),
(10, 'Consultoria Prisma', '12345678000110', 'contato@consultoriaprisma.com', '11998653218', GETDATE()),
(11, 'Indústria Vértice', '12345678000111', 'contato@industriavertice.com', '11983512796', GETDATE())
GO
SET IDENTITY_INSERT cliente OFF
GO

-- Populando funcionario_cliente
SET IDENTITY_INSERT funcionario_cliente ON
GO
INSERT funcionario_cliente (id_funcionario, nome_funcionario, email, telefone, cargo, id_cliente) VALUES 
(1, 'Lucas Silva', 'lucas.s@empresa.com', '11958010319', 'Consultor Comercial', 1),
(2, 'Mariana Almeida', 'mariana.a@empresa.com', '11968274103', 'Gerente de Contas', 2),
(3, 'Carlos Pereira', 'carlos.p@empresa.com', '11997314592', 'Analista de Projetos', 3),
(4, 'Fernanda Costa', 'fernanda.c@empresa.com', '11984927364', 'Suporte Técnico', 4),
(5, 'Ricardo Oliveira', 'ricardo.o@empresa.com', '11975830247', 'Consultor Comercial', 5),
(6, 'Juliana Mendes', 'juliana.m@empresa.com', '11993476281', 'Coordenador de TI', 6),
(7, 'André Souza', 'andre.s@empresa.com', '11964718392', 'Suporte Técnico', 7),
(8, 'Patrícia Lima', 'patricia.l@empresa.com', '11992018473', 'Analista de Projetos', 8),
(9, 'Bruno Rocha', 'bruno.r@empresa.com', '11983620947', 'Consultor Comercial', 9),
(10, 'Camila Martins', 'camila.m@empresa.com', '11977482936', 'Gerente de Contas', 10),
(11, 'Diego Santana', 'diego.s@empresa.com', '11986479123', 'Coordenador de TI', 11)
GO
SET IDENTITY_INSERT funcionario_cliente OFF
GO


-- Populando tipo_equipamento
SET IDENTITY_INSERT tipo_equipamento ON
GO
INSERT tipo_equipamento (id_tipo_equipamento, nome_tipo, descricao) VALUES 
(1, 'Notebook', 'Computador portátil para tarefas gerais'),
(2, 'Monitor', 'Tela LCD/LED para computadores'),
(3, 'Impressora', 'Dispositivo para impressão de documentos'),
(4, 'Mouse', 'Periférico apontador'),
(5, 'Teclado', 'Periférico de entrada'),
(6, 'Switch de Rede', 'Equipamento de conexão em redes locais'),
(7, 'Servidor', 'Equipamento de alto desempenho para serviços'),
(8, 'Projetor', 'Dispositivo para projeção de imagem'),
(9, 'Nobreak', 'Fonte de energia ininterrupta'),
(10, 'Webcam', 'Câmera para videoconferência'),
(11, 'Scanner', 'Equipamento para digitalização de documentos')
GO
SET IDENTITY_INSERT tipo_equipamento OFF
GO


-- Populando agente
SET IDENTITY_INSERT agente ON
GO
INSERT agente (id_agente, nome_agente, email, telefone, cargo, criado_em) VALUES
(1, 'Carlos Silva', 'carlos.silva@empresa.com', '11987654321', 'Técnico de Suporte', GETDATE()),
(2, 'Fernanda Oliveira', 'fernanda.oliveira@empresa.com', '11987654322', 'Atendente', GETDATE()),
(3, 'Marcos Pereira', 'marcos.pereira@empresa.com', '11987654323', 'Gerente de TI', GETDATE()),
(4, 'Ana Souza', 'ana.souza@empresa.com', '11987654324', 'Técnico de Rede', GETDATE()),
(5, 'Lucas Almeida', 'lucas.almeida@empresa.com', '11987654325', 'Atendente', GETDATE()),
(6, 'Juliana Costa', 'juliana.costa@empresa.com', '11987654326', 'Gerente de Projetos', GETDATE()),
(7, 'Rafael Gomes', 'rafael.gomes@empresa.com', '11987654327', 'Técnico de Hardware', GETDATE()),
(8, 'Patrícia Lima', 'patricia.lima@empresa.com', '11987654328', 'Atendente', GETDATE()),
(9, 'Thiago Martins', 'thiago.martins@empresa.com', '11987654329', 'Gerente de Suporte', GETDATE()),
(10, 'Beatriz Fernandes', 'beatriz.fernandes@empresa.com', '11987654330', 'Técnico de Software', GETDATE()),
(11, 'Eduardo Rocha', 'eduardo.rocha@empresa.com', '11987654331', 'Atendente', GETDATE())
GO
SET IDENTITY_INSERT agente OFF
GO


-- Populando equipamento
SET IDENTITY_INSERT equipamento ON
GO
INSERT equipamento (id_equipamento, nome_equipamento, descricao, numero_serie, status, id_tipo_equipamento, criado_em) VALUES
(1, 'Dell Inspiron 15', 'Notebook Dell para uso geral', 'SN12345DELL', 'disponivel', 1, GETDATE()),
(2, 'Samsung SyncMaster 24"', 'Monitor LED 24 polegadas Samsung', 'SN54321SAM', 'disponivel', 2, GETDATE()),
(3, 'HP LaserJet Pro', 'Impressora a laser HP para escritório', 'SN67890HP', 'disponivel', 3, GETDATE()),
(4, 'Logitech MX Master 3', 'Mouse sem fio avançado Logitech', 'SN98765LOG', 'disponivel', 4, GETDATE()),
(5, 'Microsoft Ergonomic Keyboard', 'Teclado ergonômico Microsoft', 'SN11223MIC', 'disponivel', 5, GETDATE()),
(6, 'Cisco Catalyst 2960', 'Switch de rede Cisco para ambientes corporativos', 'SN44556CIS', 'disponivel', 6, GETDATE()),
(7, 'Dell PowerEdge T40', 'Servidor torre para pequenas empresas', 'SN77889DEL', 'disponivel', 7, GETDATE()),
(8, 'Epson PowerLite X39', 'Projetor multimídia Epson', 'SN99001EPS', 'disponivel', 8, GETDATE()),
(9, 'APC Back-UPS 600', 'Nobreak APC para proteção contra queda de energia', 'SN22334APC', 'disponivel', 9, GETDATE()),
(10, 'Logitech C920', 'Webcam HD para videoconferência', 'SN55667LOG', 'disponivel', 10, GETDATE()),
(11, 'Canon CanoScan Lide 300', 'Scanner para documentos A4 Canon', 'SN88990CAN', 'disponivel', 11, GETDATE())
GO
SET IDENTITY_INSERT equipamento OFF
GO


-- Populando locacao
SET IDENTITY_INSERT locacao ON
GO
INSERT locacao (id_locacao, id_cliente, id_funcionario, id_agente, data_inicio, data_fim, status, observacoes, criado_em) VALUES
(1, 1, 1, 1, DATEADD(day, -10, GETDATE()), NULL, 'ativa', 'Locação para projeto temporário', GETDATE()),
(2, 2, 2, 2, DATEADD(day, -15, GETDATE()), DATEADD(day, -5, GETDATE()), 'finalizada', 'Equipamento devolvido em bom estado', GETDATE()),
(3, 3, 3, 3, DATEADD(day, -7, GETDATE()), NULL, 'ativa', 'Locação para evento corporativo', GETDATE()),
(4, 4, 4, 4, DATEADD(day, -30, GETDATE()), DATEADD(day, -1, GETDATE()), 'finalizada', 'Devolução com reparos necessários', GETDATE()),
(5, 5, 5, 5, DATEADD(day, -3, GETDATE()), NULL, 'ativa', 'Locação de equipamentos para home office', GETDATE()),
(6, 6, 6, 6, DATEADD(day, -20, GETDATE()), DATEADD(day, -10, GETDATE()), 'finalizada', 'Equipamento com defeito reportado', GETDATE()),
(7, 7, 7, 7, DATEADD(day, -5, GETDATE()), NULL, 'ativa', 'Locação para teste de software', GETDATE()),
(8, 8, 8, 8, DATEADD(day, -12, GETDATE()), DATEADD(day, -2, GETDATE()), 'finalizada', 'Locação concluída sem problemas', GETDATE()),
(9, 9, 9, 9, DATEADD(day, -1, GETDATE()), NULL, 'ativa', 'Equipamento para suporte remoto', GETDATE()),
(10, 10, 10, 10, DATEADD(day, -8, GETDATE()), NULL, 'ativa', 'Locação para treinamento interno', GETDATE()),
(11, 11, 11, 11, DATEADD(day, -18, GETDATE()), DATEADD(day, -3, GETDATE()), 'finalizada', 'Equipamento devolvido com acessórios', GETDATE())
GO
SET IDENTITY_INSERT locacao OFF
GO


-- Populando item_locacao
SET IDENTITY_INSERT item_locacao ON
GO
INSERT item_locacao (id_item_locacao, id_locacao, id_equipamento, data_retirada, data_devolucao, condicao_retirada, condicao_devolucao) VALUES
(1, 1, 1, DATEADD(day, -10, GETDATE()), NULL, 'Equipamento em perfeito estado', NULL),
(2, 2, 2, DATEADD(day, -15, GETDATE()), DATEADD(day, -5, GETDATE()), 'Novo', 'Funcionando corretamente'),
(3, 3, 3, DATEADD(day, -7, GETDATE()), NULL, 'Sem avarias', NULL),
(4, 4, 4, DATEADD(day, -30, GETDATE()), DATEADD(day, -1, GETDATE()), 'Leve desgaste', 'Pequenos reparos realizados'),
(5, 5, 5, DATEADD(day, -3, GETDATE()), NULL, 'Perfeito estado', NULL),
(6, 6, 6, DATEADD(day, -20, GETDATE()), DATEADD(day, -10, GETDATE()), 'Problemas no toner', 'Toner substituído'),
(7, 7, 7, DATEADD(day, -5, GETDATE()), NULL, 'Equipamento funcionando', NULL),
(8, 8, 8, DATEADD(day, -12, GETDATE()), DATEADD(day, -2, GETDATE()), 'Sem problemas', 'Devolução sem avarias'),
(9, 9, 9, DATEADD(day, -1, GETDATE()), NULL, 'Equipamento usado', NULL),
(10, 10, 10, DATEADD(day, -8, GETDATE()), NULL, 'Equipamento com acessórios completos', NULL),
(11, 11, 11, DATEADD(day, -18, GETDATE()), DATEADD(day, -3, GETDATE()), 'Bom estado geral', 'Devolvido com pequenas marcas')
GO
SET IDENTITY_INSERT item_locacao OFF
GO


-- Populando manutencao
SET IDENTITY_INSERT manutencao ON
GO
INSERT manutencao (id_manutencao, id_equipamento, id_agente, data_inicio, data_fim, descricao, tipo, status) VALUES
(1, 1, 1, DATEADD(day, -15, GETDATE()), NULL, 'Substituição de teclado danificado', 'preventiva', 'pendente'),
(2, 2, 2, DATEADD(day, -10, GETDATE()), DATEADD(day, -5, GETDATE()), 'Troca de cartucho de toner', 'corretiva', 'finalizada'),
(3, 3, 3, DATEADD(day, -8, GETDATE()), NULL, 'Atualização de firmware', 'preventiva', 'pendente'),
(4, 4, 4, DATEADD(day, -20, GETDATE()), DATEADD(day, -15, GETDATE()), 'Reparo de cabo HDMI', 'corretiva', 'finalizada'),
(5, 5, 5, DATEADD(day, -5, GETDATE()), NULL, 'Limpeza interna completa', 'preventiva', 'pendente'),
(6, 6, 6, DATEADD(day, -12, GETDATE()), DATEADD(day, -7, GETDATE()), 'Substituição de switch defeituoso', 'corretiva', 'finalizada'),
(7, 7, 7, DATEADD(day, -3, GETDATE()), NULL, 'Verificação de hardware', 'preventiva', 'pendente'),
(8, 8, 8, DATEADD(day, -18, GETDATE()), DATEADD(day, -10, GETDATE()), 'Ajuste de foco do projetor', 'corretiva', 'finalizada'),
(9, 9, 9, DATEADD(day, -7, GETDATE()), NULL, 'Troca de bateria do nobreak', 'preventiva', 'pendente'),
(10, 10, 10, DATEADD(day, -14, GETDATE()), DATEADD(day, -9, GETDATE()), 'Limpeza e manutenção geral', 'corretiva', 'finalizada'),
(11, 11, 11, DATEADD(day, -9, GETDATE()), NULL, 'Digitalização de documentos com scanner', 'preventiva', 'pendente')
(12, 1, 2, DATEADD(DAY, -10, GETDATE()), NULL, 'Troca de teclado', 'corretiva', 'pendente'),
(13, 1, 3, DATEADD(DAY, -30, GETDATE()), NULL, 'Atualização de sistema', 'preventiva', 'pendente'),
(14, 1, 4, DATEADD(DAY, -45, GETDATE()), NULL, 'Substituição de HD', 'corretiva', 'pendente'),
(15, 12, 1, DATEADD(DAY, -5, GETDATE()), NULL, 'Manutenção em porta USB', 'corretiva', 'pendente'),
(16, 12, 2, DATEADD(DAY, -20, GETDATE()), NULL, 'Reinstalação do Windows', 'preventiva', 'pendente'),
(17, 13, 3, DATEADD(DAY, -12, GETDATE()), NULL, 'Substituição de bateria', 'corretiva', 'pendente'),
(18, 13, 4, DATEADD(DAY, -18, GETDATE()), NULL, 'Manutenção de tela', 'corretiva', 'pendente'),
(19, 1, 1, DATEADD(day, -15, GETDATE()), NULL, 'Substituição de teclado danificado', 'preventiva', 'finalizada'),
GO
SET IDENTITY_INSERT manutencao OFF
GO

