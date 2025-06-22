CREATE TABLE [Pagamentos] (
  [cd_pagamento] int PRIMARY KEY IDENTITY(1, 1),
  [cd_contrato] int,
  [valor_pago] decimal(32,2),
  [dt_pagamento] datetime,
  [metodo_pag] nvarchar(255) NOT NULL CHECK ([metodo_pag] IN ('DINHEIRO', 'PIX', 'CREDITO', 'DEBITO'))
)

ALTER TABLE [Pagamentos] ADD FOREIGN KEY ([cd_contrato]) REFERENCES [Contratos] ([cd_contrato])
GO