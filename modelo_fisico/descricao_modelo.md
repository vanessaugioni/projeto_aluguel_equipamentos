# Análise de Normalização do Modelo Físico

Este documento apresenta a análise de normalização do modelo físico proposto, com base nas três primeiras formas normais (1FN, 2FN e 3FN), e aponta decisões de desnormalização adotadas com justificativa.

---

## Primeira Forma Normal (1FN)

**Requisitos:**
- Todos os atributos devem ser atômicos;
- Cada campo deve conter apenas um único valor por registro.

**Análise:**  
Atendida.  
Todos os atributos representam valores atômicos. Não há campos multivalorados ou grupos repetitivos.

---

## Segunda Forma Normal (2FN)

**Requisitos:**
- Estar na 1FN;
- Todos os atributos não-chave devem depender da chave primária completa.

**Análise:**  
Atendida.  
As tabelas utilizam chaves primárias simples (`int auto increment`) e os demais atributos dependem diretamente da chave primária.

---

## Terceira Forma Normal (3FN)

**Requisitos:**
- Estar na 2FN;
- Nenhum atributo não-chave deve depender de outro atributo não-chave.

**Análise:**  
Atendida.  
Não há dependências transitivas. Todos os atributos não-chave dependem apenas da chave primária.

---

## Pontos de Desnormalização Justificada

### 1. Campos de status e tipo como `varchar(20)`

Exemplos: `status` em `equipamento`, `locacao`, `manutencao`; `tipo` em `manutencao`.

**Justificativa:**  
Optou-se por manter os campos diretamente como texto por simplicidade. Como os valores possíveis são limitados e controlados na aplicação, não foi criada uma tabela auxiliar para esses dados.

---

### 2. Campos de contato repetidos em várias tabelas

Exemplos: `telefone`, `email` em `cliente`, `funcionario_cliente` e `agente`.

**Justificativa:**  
Manter essas informações nas próprias tabelas facilita a leitura e o uso, especialmente em sistemas de pequeno porte ou acadêmicos. A centralização em uma tabela de contatos foi evitada para não aumentar a complexidade.

---

## Conclusão

O modelo está normalizado até a Terceira Forma Normal (3FN), atendendo aos critérios de integridade e eliminação de redundâncias. As decisões de desnormalização foram feitas por questões de clareza e simplicidade, alinhadas ao contexto acadêmico do trabalho.