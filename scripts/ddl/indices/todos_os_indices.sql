
EXEC sp_helpindex 'clientes';
EXEC sp_helpindex 'Pagamentos';
EXEC sp_helpindex 'Contratos';
EXEC sp_helpindex 'Planos';
EXEC sp_helpindex 'agendas';
EXEC sp_helpindex 'controle_acessos';
EXEC sp_helpindex 'funcionarios';
EXEC sp_helpindex 'aulas';

-- thiago

CREATE NONCLUSTERED INDEX IDX_Pagamentos_dt_pagamento
ON Pagamentos (dt_pagamento)
INCLUDE (cd_contrato, valor_pago, cd_pagamento);

CREATE NONCLUSTERED INDEX IDX_Contratos_cd_contrato_aberto
on Contratos (cd_contrato)
include (cd_plano, cd_cliente);

CREATE NONCLUSTERED INDEX IDX_Planos_cd_plano
ON Planos (cd_plano)
INCLUDE (nm_plano, tp_plano);

CREATE NONCLUSTERED INDEX IDX_Clientes_cd_cliente
ON Clientes (cd_cliente);

-- Luis

CREATE NONCLUSTERED INDEX IDX_Agendas_AulaAluno
ON Agendas (cd_aula)
INCLUDE (cd_aluno);

CREATE NONCLUSTERED INDEX IDX_Aulas_AulaInstrutor
ON Aulas (cd_aula)
INCLUDE (capacidade, nm_aula, cd_instrutor);

CREATE NONCLUSTERED INDEX IDX_Funcionarios_Cargo
ON Funcionarios (nm_cargo)
INCLUDE (nm_funcionario, cd_funcionario);

-- Guilherme

CREATE NONCLUSTERED INDEX IDX_Contratos_ClientePlanoStatus
ON Contratos (cd_cliente)
INCLUDE (cd_plano, status);

CREATE NONCLUSTERED INDEX IDX_Pagamentos_ContratoValor
ON Pagamentos (cd_contrato)
INCLUDE (valor_pago);

CREATE NONCLUSTERED INDEX IDX_Clientes_ClienteNomeCadastro
ON Clientes (cd_cliente)
INCLUDE (nm_cliente, dt_cadastro);

-- fernando

CREATE NONCLUSTERED INDEX IDX_Contratos_dt_ultima_inativacao
ON Contratos (dt_ultima_inativacao)
INCLUDE (cd_plano);

CREATE NONCLUSTERED INDEX IDX_Planos_cd_plano_preco_tipo
ON Planos (cd_plano)
INCLUDE (tp_plano, vl_preco);

-- gabriel
--5.
CREATE NONCLUSTERED INDEX IDX_Contratos_Status_Ativo
ON Contratos (status)
INCLUDE (cd_cliente, cd_plano);

CREATE NONCLUSTERED INDEX IDX_Clientes_Cadastro_Nome
ON Clientes (dt_cadastro)
INCLUDE (nm_cliente);

CREATE NONCLUSTERED INDEX IDX_Planos
ON Planos (cd_plano)
INCLUDE (nm_plano, tp_plano, vl_preco);

--6.
CREATE NONCLUSTERED INDEX IDX_Planos_TipoPlano
ON Planos (tp_plano);

CREATE NONCLUSTERED INDEX IDX_Contratos_Cliente_Plano
ON Contratos (cd_cliente) 
INCLUDE (cd_plano);

CREATE NONCLUSTERED INDEX IDX_Aulas_Instrutor
ON Aulas (cd_instrutor)
INCLUDE (cd_aula);

CREATE NONCLUSTERED INDEX IDX_Funcionarios_Cargo_Nome
ON Funcionarios (nm_cargo) 
INCLUDE (nm_funcionario);

