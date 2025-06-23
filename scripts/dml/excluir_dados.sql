
-- Desabilita todas as FKs do banco temporariamente
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL"

-- Deletar os dados de todas as tabelas (na ordem certa)
DELETE FROM item_locacao;
DELETE FROM locacao;
DELETE FROM manutencao;
DELETE FROM equipamento;
DELETE FROM tipo_equipamento;
DELETE FROM funcionario_cliente;
DELETE FROM agente;
DELETE FROM cliente;

--Resetar os campos IDENTITY para voltar a contar do 1
DBCC CHECKIDENT ('item_locacao', RESEED, 0);
DBCC CHECKIDENT ('locacao', RESEED, 0);
DBCC CHECKIDENT ('manutencao', RESEED, 0);
DBCC CHECKIDENT ('equipamento', RESEED, 0);
DBCC CHECKIDENT ('tipo_equipamento', RESEED, 0);
DBCC CHECKIDENT ('funcionario_cliente', RESEED, 0);
DBCC CHECKIDENT ('agente', RESEED, 0);
DBCC CHECKIDENT ('cliente', RESEED, 0);



-- Reabilita todas as FKs e força verificação dos dados existentes
EXEC sp_msforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL"
