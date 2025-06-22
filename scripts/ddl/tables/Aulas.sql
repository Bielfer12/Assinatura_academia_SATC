CREATE TABLE [Aulas] (
  [cd_aula] int PRIMARY KEY IDENTITY(1, 1),
  [nm_aula] nvarchar(255),
  [descricao] varchar(max),
  [dt_inicio] datetime,
  [dt_fim] datetime,
  [cd_instrutor] int,
  [capacidade] int
)

ALTER TABLE [Aulas] ADD FOREIGN KEY ([cd_instrutor]) REFERENCES [Funcionarios] ([cd_funcionario])
GO