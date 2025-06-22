CREATE TABLE [Contratos] (
  [cd_contrato] int PRIMARY KEY IDENTITY(1, 1),
  [cd_funcionario] int,
  [cd_cliente] int,
  [cd_plano] int,
  [dt_inicio] date,
  [dt_fim] date,
  [dt_ultima_inativacao] DATE,
  [status] nvarchar(255) NOT NULL CHECK ([status] IN ('ATIVO', 'INATIVO', 'PENDENTE'))
)

ALTER TABLE [Contratos] ADD FOREIGN KEY ([cd_funcionario]) REFERENCES [Funcionarios] ([cd_funcionario])
GO

ALTER TABLE [Contratos] ADD FOREIGN KEY ([cd_cliente]) REFERENCES [Clientes] ([cd_cliente])
GO

ALTER TABLE [Contratos] ADD FOREIGN KEY ([cd_plano]) REFERENCES [Planos] ([cd_plano])
GO