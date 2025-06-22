CREATE TABLE [Planos] (
  [cd_plano] int PRIMARY KEY IDENTITY(1, 1),
  [nm_plano] varchar(80),
  [descricao] varchar(max),
  [vl_preco] decimal(32,2),
  [tp_plano] nvarchar(255) NOT NULL CHECK ([tp_plano] IN ('BLACK', 'GOLD', 'STANDART'))
)