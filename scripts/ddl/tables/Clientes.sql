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