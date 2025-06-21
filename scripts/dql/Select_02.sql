-- Quais instrutores possuem as aulas com maior taxa de ocupação, considerando o número de alunos agendados versus a capacidade da aula?

WITH AlunosPorAula AS (
    SELECT
        ag.cd_aula,
        COUNT(DISTINCT ag.cd_aluno) AS QtdAlunosAgendados
    FROM Agendas ag
    GROUP BY ag.cd_aula
),
AulasComInstrutores AS (
    SELECT
        a.cd_aula,
        a.nm_aula,
        a.capacidade,
        a.cd_instrutor
    FROM Aulas a
),
InstrutoresDetalhes AS (
    SELECT
        f.cd_funcionario,
        f.nm_funcionario AS NomeInstrutor,
        f.nm_cargo
    FROM Funcionarios f
    WHERE f.nm_cargo LIKE '%Instrutor%'
),
TaxaOcupacao AS (
    SELECT
        a.cd_aula,
        a.nm_aula,
        i.cd_funcionario,
        i.NomeInstrutor,
        i.nm_cargo,
        a.capacidade,
        ISNULL(apa.QtdAlunosAgendados, 0) AS AlunosAgendados,
        CASE 
            WHEN a.capacidade > 0 THEN CAST(ISNULL(apa.QtdAlunosAgendados, 0) * 100.0 / a.capacidade AS DECIMAL(5,2))
            ELSE 0
        END AS TaxaOcupacaoPercentual 
    FROM AulasComInstrutores a
    LEFT JOIN AlunosPorAula apa ON a.cd_aula = apa.cd_aula
    LEFT JOIN InstrutoresDetalhes i ON a.cd_instrutor = i.cd_funcionario
)
SELECT
    NomeInstrutor,
    cd_aula,
    nm_aula,
    capacidade,
    AlunosAgendados,
    TaxaOcupacaoPercentual
FROM TaxaOcupacao
WHERE capacidade > 0
ORDER BY TaxaOcupacaoPercentual DESC, NomeInstrutor, nm_aula;