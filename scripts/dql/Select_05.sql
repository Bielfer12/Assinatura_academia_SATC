--Qual é o panorama completo de cada um dos nossos planos? Para cada plano, quero saber o total de clientes ativos, a receita mensal 
--recorrente que eles geram e, adicionalmente, uma lista com os 3 clientes mais leais (mais antigos) daquele plano.

WITH PlanoSumario AS (
    SELECT
        b.cd_plano,
        b.nm_plano,
        b.tp_plano,
        COUNT(a.cd_cliente) AS QtdClientesAtivos,
        SUM(b.vl_preco) AS ReceitaMensalTotal
    FROM
        Contratos a -- Antigo alias: C
    INNER JOIN
        Planos b ON a.cd_plano = b.cd_plano 
    WHERE
        a.status = 'ATIVO'
    GROUP BY
        b.cd_plano, b.nm_plano, b.tp_plano
),
ClientesLeaisRankeados AS (
    SELECT
        c.nm_cliente,
        d.cd_plano,
        ROW_NUMBER() OVER (PARTITION BY d.cd_plano ORDER BY c.dt_cadastro ASC) AS RankingLealdade
    FROM
        Clientes AS c -- Antigo alias: C
    INNER JOIN
        Contratos AS d ON c.cd_cliente = d.cd_cliente 
    WHERE
        d.status = 'ATIVO'
),
ClientesAgrupados3 AS (
    SELECT
        cd_plano,
        STRING_AGG(CONCAT(RankingLealdade, '. ', nm_cliente), CHAR(13)) AS Lista3Clientes
    FROM
        ClientesLeaisRankeados 
    WHERE
        RankingLealdade <= 3
    GROUP BY
        cd_plano
)
SELECT
    f.nm_plano AS 'Nome do Plano:',
    f.tp_plano AS 'Tipo do Plano:',
    f.QtdClientesAtivos AS 'Qtd. de Clientes Ativos:',
    FORMAT(f.ReceitaMensalTotal, 'C', 'pt-BR') AS 'Receita Mensal do Plano:',
    ISNULL(g.Lista3Clientes, 'N/A') AS 'Top 3 Clientes Mais Leais:'
FROM
    PlanoSumario f 
LEFT JOIN
    ClientesAgrupados3 g ON f.cd_plano = g.cd_plano 
ORDER BY
    f.ReceitaMensalTotal DESC;

--indices:

CREATE NONCLUSTERED INDEX IX_Contratos_Status_Ativo
ON Contratos (status)
INCLUDE (cd_cliente, cd_plano);

CREATE NONCLUSTERED INDEX IX_Clientes_Cadastro_Nome
ON Clientes (dt_cadastro)
INCLUDE (nm_cliente);

CREATE NONCLUSTERED INDEX IX_Planos_Plano
ON Planos (cd_plano)
INCLUDE (nm_plano, tp_plano, vl_preco);
