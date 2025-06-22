--Quais são os 5 clientes mais antigos com contratos do tipo ATIVO ou PENDENTE que possuem um nivel de atividade Muito Ativo, Ativo ou Moderado em Agosto de 2024. Mostre o nome, qual o tipo de plano o valor pago pelo cliente, com uma função de janela ache a média do valor pago por todos os clientes com o mesmo tipo de plano.
WITH clientescomTotalPago AS (
    SELECT C.cd_cliente, C.nm_cliente, C.dt_cadastro, P.nm_plano, P.tp_plano, Co.status AS status_contrato,SUM(ISNULL(Pa.valor_pago, 0)) AS valorPagoCliente
    FROM
        Clientes AS C
    INNER JOIN
        Contratos AS Co ON C.cd_cliente = Co.cd_cliente
    INNER JOIN
        Planos AS P ON Co.cd_plano = P.cd_plano
    LEFT JOIN
        Pagamentos AS Pa ON Co.cd_contrato = Pa.cd_contrato
    GROUP BY
        C.cd_cliente, C.nm_cliente, C.dt_cadastro, P.nm_plano, P.tp_plano, Co.status
)
SELECT TOP 5
    CTE.nm_cliente AS 'Nome do cliente',
    CTE.nm_plano AS 'Nome do plano',
    CTE.tp_plano AS 'Tipo do plano',
    CTE.valorPagoCliente AS 'Valor pago pelos clientes',
    AVG(CTE.valorPagoCliente) OVER (PARTITION BY CTE.tp_plano) AS 'Media do valor pago por tipo de plano',
    CTE.dt_cadastro AS 'Data de cadastro dos clientes',

    dbo.fn_ObterNivelAtividadeCliente(CTE.cd_cliente, '2024-08-01', '2024-08-31') AS 'Nível da atividade dos clientes em Agosto de 2024'
FROM
    clientescomTotalPago AS CTE
WHERE
    CTE.status_contrato IN ('ATIVO', 'PENDENTE')
    AND
    dbo.fn_ObterNivelAtividadeCliente(CTE.cd_cliente, '2024-08-01', '2024-08-31') IN ('Muito Ativo', 'Ativo', 'Moderado')
ORDER BY
    CTE.dt_cadastro ASC;