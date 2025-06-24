--Qual instrutor ministra aulas mais procuradas por alunos com plano GOLD ou BLACK?

WITH AgendamentosVIP AS (
    SELECT
        a.cd_aluno,
        a.cd_aula
    FROM
        Agendas AS a
    INNER JOIN
        Contratos AS c ON a.cd_aluno = c.cd_cliente
    INNER JOIN
        Planos AS p ON c.cd_plano = p.cd_plano
    WHERE
        p.tp_plano IN ('GOLD', 'BLACK')
)
SELECT
    f.nm_funcionario AS 'Nome do Instrutor',
    COUNT(av.cd_aluno) AS 'Qtd de Agendamentos por Alunos (GOLD e BLACK)'
FROM
    AgendamentosVIP av
INNER JOIN
    Aulas au ON av.cd_aula = au.cd_aula
INNER JOIN
    Funcionarios f ON au.cd_instrutor = f.cd_funcionario
WHERE
    f.nm_cargo LIKE '%Instrutor%' 
GROUP BY
    f.cd_funcionario, f.nm_funcionario
ORDER BY
    'Qtd de Agendamentos por Alunos (GOLD e BLACK)' DESC;

--indices

--indice na tabela Planos para acelerar o filtro por tipo de plano.
CREATE NONCLUSTERED INDEX IDX_Planos_TipoPlano
ON Planos (tp_plano);

--indice na tabela contratos para otimizar os joins.
--inclui o cd_plano para que a busca por tipo de plano seja mais rapida.
CREATE NONCLUSTERED INDEX IDX_Contratos_Cliente_Plano
ON Contratos (cd_cliente) 
INCLUDE (cd_plano);

--indice na tabela Aulas para otimizar o join com Funcionarios.
CREATE NONCLUSTERED INDEX IDX_Aulas_Instrutor
ON Aulas (cd_instrutor)
INCLUDE (cd_aula);

--indice na tabela funcionarios para acelerar a filtragem por cargo.
CREATE NONCLUSTERED INDEX IDX_Funcionarios_Cargo_Nome
ON Funcionarios (nm_cargo) 
INCLUDE (nm_funcionario);

