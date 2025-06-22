CREATE TABLE [Controle_Acessos] (
  [cd_acesso] int PRIMARY KEY IDENTITY(1, 1),
  [cd_cliente] int,
  [dt_entrada] datetime,
  [dt_saida] datetime
)

ALTER TABLE [Controle_Acessos] ADD FOREIGN KEY ([cd_cliente]) REFERENCES [Clientes] ([cd_cliente])
GO