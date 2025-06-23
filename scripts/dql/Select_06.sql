--Quais instrutores são mais eficientes em preencher a capacidade das aulas que ministram?

WITH OcupacaoPorAula AS (
    SELECT
        a.cd_aula,
        a.cd_instrutor,
        a.capacidade,
        COUNT(DISTINCT b.cd_aluno) AS AlunosAgendados,
        CASE
            WHEN a.capacidade > 0 THEN (CAST(COUNT(DISTINCT b.cd_aluno) AS FLOAT) * 100.0 / a.capacidade)
            ELSE 0
        END AS TaxaOcupacaoPercentual
    FROM
        Aulas AS a 
    LEFT JOIN 
        Agendas AS b ON a.cd_aula = b.cd_aula 
    GROUP BY
        a.cd_aula, a.capacidade, a.cd_instrutor
)
SELECT
    d.nm_funcionario AS 'Nome do Instrutor',
    COUNT(c.cd_aula) AS 'Qtd. de Aulas Diferentes Ministradas',
    SUM(c.AlunosAgendados) AS 'Total de Alunos Agendados',
    FORMAT(AVG(c.TaxaOcupacaoPercentual), 'N2') + '%' AS 'Taxa Média de Ocupação'
FROM
    OcupacaoPorAula c 
INNER JOIN
    Funcionarios d ON c.cd_instrutor = d.cd_funcionario 
WHERE
    d.nm_cargo LIKE '%Instrutor%' 
GROUP BY
    d.cd_funcionario, d.nm_funcionario
ORDER BY
    AVG(c.TaxaOcupacaoPercentual) DESC;

--indices

CREATE NONCLUSTERED INDEX IX_Aulas_Aula_Instrutor_Capacidade
ON Aulas (cd_aula) 
INCLUDE (cd_instrutor, capacidade);

CREATE NONCLUSTERED INDEX IX_Funcionarios_Cargo_Nome
ON Funcionarios (nm_cargo) 
INCLUDE (nm_funcionario);
