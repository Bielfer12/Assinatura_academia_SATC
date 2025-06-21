//Quais são os planos que mais geraram faturamento nos últimos 12 meses?

WITH PagamentosRecentes AS (
    SELECT
        p.cd_pagamento,
        p.cd_contrato,
        p.valor_pago,
        p.dt_pagamento
    FROM Pagamentos p
    WHERE p.dt_pagamento >= DATEADD(MONTH, -12, GETDATE())
)
SELECT
    pl.nm_plano AS Plano,
    pl.tp_plano AS Tipo,
    COUNT(DISTINCT c.cd_cliente) AS Qtd_Clientes,
    COUNT(pr.cd_pagamento) AS Qtd_Pagamentos,
    SUM(pr.valor_pago) AS Total_Faturado
FROM PagamentosRecentes pr
JOIN Contratos ct ON pr.cd_contrato = ct.cd_contrato
JOIN Planos pl ON ct.cd_plano = pl.cd_plano
JOIN Clientes c ON ct.cd_cliente = c.cd_cliente
GROUP BY pl.nm_plano, pl.tp_plano
ORDER BY Total_Faturado DESC;