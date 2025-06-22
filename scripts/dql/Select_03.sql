-- Qual foi a perda de receita mensal recorrente (MRR Loss) de contratos que foram inativados no último trimestre, e qual o principal tipo de plano (Standard, Gold, Black) afetado por esses cancelamentos?

UPDATE Contratos
SET status = 'INATIVO'
WHERE cd_contrato = 5;

SELECT
    FORMAT(C.dt_ultima_inativacao, 'yyyy-MM') AS "Mês da Inativação",
    P.tp_plano AS "Categoria do Plano",
    COUNT(C.cd_contrato) AS "Qtd. Contratos Inativados",
    FORMAT(SUM(P.vl_preco), 'C', 'pt-BR') AS "Perda de Receita Mensal"
FROM
    dbo.Contratos C
JOIN
    dbo.Planos P ON C.cd_plano = P.cd_plano
WHERE
    C.dt_ultima_inativacao >= DATEADD(month, -3, GETDATE())
GROUP BY
    FORMAT(C.dt_ultima_inativacao, 'yyyy-MM'),
    P.tp_plano
ORDER BY
    "Mês da Inativação" DESC,
    "Perda de Receita Mensal" DESC;