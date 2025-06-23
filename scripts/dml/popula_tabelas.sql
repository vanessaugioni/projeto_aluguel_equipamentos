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
(1, 'Lenovo ThinkPad X1', 'Notebook empresarial da Lenovo', 'SN0012LEN', 'Disponível', 1, '2025-06-11 10:00:00'),
(2, 'Asus VivoBook 15', 'Notebook Asus para uso geral', 'SN0013ASU', 'Disponível', 1, '2025-06-10 10:00:00'),
(3, 'HP EliteBook 840', 'Notebook de alta performance HP', 'SN0014HP', 'Disponível', 1, '2025-06-09 10:00:00'),
(4, 'MacBook Pro 14"', 'Notebook Apple para desenvolvedores', 'SN0015MAC', 'Disponível', 1, '2025-06-08 10:00:00'),
(5, 'Dell Latitude 7420', 'Notebook corporativo Dell', 'SN0016DEL', 'Disponível', 1, '2025-06-07 10:00:00'),
(6, 'Samsung Book i7', 'Notebook Samsung com bom custo-benefício', 'SN0017SAM', 'Disponível', 1, '2025-06-06 10:00:00'),
(7, 'Acer Aspire 5', 'Notebook Acer para tarefas diárias', 'SN0018ACE', 'Disponível', 1, '2025-06-05 10:00:00'),
(8, 'Positivo Motion Q', 'Notebook básico nacional', 'SN0019POS', 'Disponível', 1, '2025-06-04 10:00:00'),
(9, 'LG Gram 16', 'Notebook ultraleve LG', 'SN0020LG', 'Disponível', 1, '2025-06-03 10:00:00'),
(10, 'Microsoft Surface Laptop', 'Notebook Microsoft premium', 'SN0021MIC', 'Disponível', 1, '2025-06-02 10:00:00'),
(11, 'Avell LIV A52', 'Notebook gamer brasileiro', 'SN0022AVE', 'Disponível', 1, '2025-06-01 10:00:00')
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
(1, 1, 2, '2025-05-30 10:00:00', NULL, 'Troca de teclado', 'Corretiva', 'Pendente'),
(2, 2, 3, '2025-05-28 10:00:00', NULL, 'Atualização de sistema', 'Corretiva', 'Pendente'),
(3, 3, 4, '2025-05-26 10:00:00', NULL, 'Substituição de HD', 'Corretiva', 'Concluída'),
(4, 4, 5, '2025-05-24 10:00:00', NULL, 'Manutenção em porta USB', 'Corretiva', 'Pendente'),
(5, 5, 6, '2025-05-22 10:00:00', NULL, 'Reinstalação do Windows', 'Corretiva', 'Pendente'),
(6, 6, 7, '2025-05-20 10:00:00', NULL, 'Substituição de bateria', 'Corretiva', 'Pendente'),
(7, 7, 8, '2025-05-18 10:00:00', NULL, 'Manutenção de tela', 'Corretiva', 'Concluída'),
(8, 8, 9, '2025-05-16 10:00:00', NULL, 'Limpeza de cooler', 'Corretiva', 'Pendente'),
(9, 9, 10, '2025-05-14 10:00:00', NULL, 'Upgrade de memória RAM', 'Corretiva', 'Pendente'),
(10, 10, 11, '2025-05-12 10:00:00', NULL, 'Troca de pasta térmica', 'Corretiva', 'Pendente'),
(11, 11, 1, '2025-05-10 10:00:00', NULL, 'Verificação de desempenho', 'Corretiva', 'Concluída')
GO
SET IDENTITY_INSERT manutencao OFF
GO

