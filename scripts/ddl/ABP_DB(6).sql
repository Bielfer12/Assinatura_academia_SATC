CREATE SCHEMA [ABP]
GO

CREATE TABLE [Clientes] (
  [cd_cliente] int PRIMARY KEY IDENTITY(1, 1),
  [nm_cliente] varchar(80),
  [cpf] varchar(11) UNIQUE NOT NULL,
  [email] varchar(80),
  [telefone] varchar(15),
  [dt_nascimento] date,
  [endereco] varchar(max),
  [dt_cadastro] datetime
)
GO

CREATE TABLE [Funcionarios] (
  [cd_funcionario] int PRIMARY KEY IDENTITY(1, 1),
  [nm_funcionario] varchar(80),
  [cpf] varchar(11) UNIQUE,
  [email] varchar(80) UNIQUE,
  [telefone] varchar(15),
  [cd_cargo] int,
  [nm_cargo] varchar(90),
  [dt_admissao] date,
  [dt_demissao] date,
  [dt_afastamento] date,
  [dt_retorno] date
)
GO

CREATE TABLE [Planos] (
  [cd_plano] int PRIMARY KEY IDENTITY(1, 1),
  [nm_plano] varchar(80),
  [descricao] varchar(max),
  [vl_preco] decimal(32,2),
  [tp_plano] nvarchar(255) NOT NULL CHECK ([tp_plano] IN ('BLACK', 'GOLD', 'STANDARD'))
)
GO

CREATE TABLE [Contratos] (
  [cd_contrato] int PRIMARY KEY IDENTITY(1, 1),
  [cd_funcionario] int,
  [cd_cliente] int,
  [cd_plano] int,
  [dt_inicio] date,
  [dt_fim] date,
  [status] nvarchar(255) NOT NULL CHECK ([status] IN ('ATIVO', 'INATIVO', 'PENDENTE'))
)
GO

CREATE TABLE [Aulas] (
  [cd_aula] int PRIMARY KEY IDENTITY(1, 1),
  [nm_aula] nvarchar(255),
  [descricao] varchar(max),
  [dt_inicio] datetime,
  [dt_fim] datetime,
  [cd_instrutor] int,
  [capacidade] int
)
GO

CREATE TABLE [Controle_Acessos] (
  [cd_acesso] int PRIMARY KEY IDENTITY(1, 1),
  [cd_cliente] int,
  [dt_entrada] datetime,
  [dt_saida] datetime
)
GO

CREATE TABLE [Pagamentos] (
  [cd_pagamento] int PRIMARY KEY IDENTITY(1, 1),
  [cd_contrato] int,
  [valor_pago] decimal(32,2),
  [dt_pagamento] datetime,
  [metodo_pag] nvarchar(255) NOT NULL CHECK ([metodo_pag] IN ('DINHEIRO', 'PIX', 'CREDITO', 'DEBITO'))
)
GO

CREATE TABLE [Agendas] (
  [cd_agenda] int PRIMARY KEY IDENTITY(1, 1),
  [cd_aula] int,
  [nm_aula] varchar(30),
  [cd_aluno] int,
  [dias_semana] nvarchar(255) NOT NULL CHECK ([dias_semana] IN ('SEGUNDA', 'TERÇA', 'QUARTA', 'QUINTA', 'SEXTA', 'SABADO', 'DOMINGO'))
)
GO

ALTER TABLE [Contratos] ADD FOREIGN KEY ([cd_funcionario]) REFERENCES [Funcionarios] ([cd_funcionario])
GO

ALTER TABLE [Contratos] ADD FOREIGN KEY ([cd_cliente]) REFERENCES [Clientes] ([cd_cliente])
GO

ALTER TABLE [Contratos] ADD FOREIGN KEY ([cd_plano]) REFERENCES [Planos] ([cd_plano])
GO

ALTER TABLE [Aulas] ADD FOREIGN KEY ([cd_instrutor]) REFERENCES [Funcionarios] ([cd_funcionario])
GO

ALTER TABLE [Controle_Acessos] ADD FOREIGN KEY ([cd_cliente]) REFERENCES [Clientes] ([cd_cliente])
GO

ALTER TABLE [Pagamentos] ADD FOREIGN KEY ([cd_contrato]) REFERENCES [Contratos] ([cd_contrato])
GO

ALTER TABLE [Agendas] ADD FOREIGN KEY ([cd_aula]) REFERENCES [Aulas] ([cd_aula])
GO

ALTER TABLE [Agendas] ADD FOREIGN KEY ([cd_aluno]) REFERENCES [Clientes] ([cd_cliente])
GO
