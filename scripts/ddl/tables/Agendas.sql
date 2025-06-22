CREATE TABLE [Agendas] (
  [cd_agenda] int PRIMARY KEY IDENTITY(1, 1),
  [cd_aula] int,
  [nm_aula] varchar(30),
  [cd_aluno] int,
  [dias_semana] nvarchar(255) NOT NULL CHECK ([dias_semana] IN ('SEGUNDA', 'TERÇA', 'QUARTA', 'QUINTA', 'SEXTA', 'SABADO', 'DOMINGO'))
)

ALTER TABLE [Agendas] ADD FOREIGN KEY ([cd_aula]) REFERENCES [Aulas] ([cd_aula])
GO

ALTER TABLE [Agendas] ADD FOREIGN KEY ([cd_aluno]) REFERENCES [Clientes] ([cd_cliente])
GO