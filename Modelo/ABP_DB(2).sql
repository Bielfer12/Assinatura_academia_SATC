CREATE SCHEMA [desc]
GO

CREATE TABLE [Usuarios] (
  [cd_usuario] int PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(80),
  [senha] VARBINARY(64) NOT NULL,
  [email] varchar(80) UNIQUE,
  [tipo] nvarchar(255) NOT NULL CHECK ([tipo] IN ('ADMINISTRADOR', 'PADRAO'))
)
GO

CREATE TABLE [Clientes] (
  [cd_cliente] int PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(80),
  [cpf] varchar(11) UNIQUE NOT NULL,
  [email] varchar(80),
  [telefone] varchar(11),
  [data_nascimento] date,
  [endereco] varchar(max),
  [dt_cadastro] datetime
)
GO

CREATE TABLE [Funcionarios] (
  [cd_funcionario] int PRIMARY KEY IDENTITY(1, 1),
  [cd_usuario] int,
  [nome] varchar(80),
  [cpf] varchar(11) UNIQUE,
  [email] varchar(80) UNIQUE,
  [telefone] varchar(11),
  [cargo] varchar(90),
  [dt_admissao] date,
  [dt_demissao] date
)
GO

CREATE TABLE [afastamentos] (
  [cd_afastamento] int PRIMARY KEY IDENTITY(1, 1),
  [cd_funcionario] int,
  [dt_afastamento] date,
  [dt_retorno] date,
  [tipo_afa] nvarchar(255) NOT NULL CHECK ([tipo_afa] IN ('FERIAS', 'ATESTADO MÉDICO', 'LICENÇA', 'Afastamento por Doença ou Acidente', 'Licenças Legais (previstas na CLT)', 'Licenças Acordadas (por negociação com a empresa)', 'Afastamento por Invalidez')),
  [descrição_afa] varchar(max)
)
GO

CREATE TABLE [Planos] (
  [cd_plano] int PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(80),
  [descricao] varchar(max),
  [preco] decimal(32,2),
  [tipo] nvarchar(255) NOT NULL CHECK ([tipo] IN ('BLACK', 'GOLD', 'STANDART'))
)
GO

CREATE TABLE [Contratos] (
  [cd_contrato] int PRIMARY KEY IDENTITY(1, 1),
  [cd_funcionario] int,
  [cd_cliente] int,
  [cd_plano] int,
  [data_inicio] date,
  [data_fim] date,
  [status] nvarchar(255) NOT NULL CHECK ([status] IN ('ATIVO', 'INATIVO', 'PENDENTE'))
)
GO

CREATE TABLE [Aulas] (
  [cd_aula] int PRIMARY KEY IDENTITY(1, 1),
  [nome] nvarchar(255),
  [descricao] varchar(max),
  [horario] datetime,
  [instrutor_id] int,
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
  [metodo_pag] nvarchar(255) NOT NULL CHECK ([metodo_pag] IN ('DINHEIRO', 'PIX', 'CREDITO', 'DEBITO'))
)
GO

ALTER TABLE [Funcionarios] ADD FOREIGN KEY ([cd_usuario]) REFERENCES [Usuarios] ([cd_usuario])
GO

ALTER TABLE [afastamentos] ADD FOREIGN KEY ([cd_funcionario]) REFERENCES [Funcionarios] ([cd_funcionario])
GO

ALTER TABLE [Contratos] ADD FOREIGN KEY ([cd_funcionario]) REFERENCES [Funcionarios] ([cd_funcionario])
GO

ALTER TABLE [Contratos] ADD FOREIGN KEY ([cd_cliente]) REFERENCES [Clientes] ([cd_cliente])
GO

ALTER TABLE [Contratos] ADD FOREIGN KEY ([cd_plano]) REFERENCES [Planos] ([cd_plano])
GO

ALTER TABLE [Aulas] ADD FOREIGN KEY ([instrutor_id]) REFERENCES [Funcionarios] ([cd_funcionario])
GO

ALTER TABLE [Controle_Acessos] ADD FOREIGN KEY ([cd_cliente]) REFERENCES [Clientes] ([cd_cliente])
GO

ALTER TABLE [Pagamentos] ADD FOREIGN KEY ([cd_contrato]) REFERENCES [Contratos] ([cd_contrato])
GO
