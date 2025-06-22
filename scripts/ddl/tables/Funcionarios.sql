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