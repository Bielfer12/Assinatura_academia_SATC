CREATE FUNCTION dbo.fn_ObterNivelAtividadeCliente
(
    @idCliente INT,            
    @dtInicioPeriodo DATE,     
    @dtFimPeriodo DATE        
)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @nivelAtividade NVARCHAR(50);
    DECLARE @totalAcessos INT;
    DECLARE @contratoAtivo BIT;
    DECLARE @clienteExiste BIT;

    IF @dtInicioPeriodo IS NULL OR @dtFimPeriodo IS NULL OR @dtInicioPeriodo > @dtFimPeriodo
    BEGIN
        RETURN 'Período inválido'; 
    END;

       SELECT @clienteExiste = CASE WHEN EXISTS (SELECT 1 FROM Clientes WHERE cd_cliente = @idCliente) THEN 1 ELSE 0 END;
    
    IF @clienteExiste = 0
    BEGIN
        RETURN 'Cliente não foi encontrado';
    END;

    SELECT @contratoAtivo = CASE WHEN EXISTS (
        SELECT 1
        FROM Contratos c
        WHERE c.cd_cliente = @idCliente
          AND c.status = 'ATIVO' 
          AND c.dt_inicio <= @dtFimPeriodo 
          AND (c.dt_fim IS NULL OR c.dt_fim >= @dtInicioPeriodo) 
    ) THEN 1 ELSE 0 END;

    SELECT @totalAcessos = COUNT(ca.cd_acesso)
    FROM Controle_Acessos ca
    WHERE ca.cd_cliente = @idCliente
      AND ca.dt_entrada >= @dtInicioPeriodo
      AND ca.dt_entrada <= @dtFimPeriodo;

    IF @contratoAtivo = 0
    BEGIN
      
        SET @nivelAtividade = 'Inativo';
    END
    ELSE IF @totalAcessos >= 8
    BEGIN
        SET @nivelAtividade = 'Muito ativo';
    END
    ELSE IF @totalAcessos >= 4 AND @totalAcessos < 8
    BEGIN
        SET @nivelAtividade = 'Ativo';
    END
    ELSE IF @totalAcessos >= 1 AND @totalAcessos < 4
    BEGIN
        SET @nivelAtividade = 'Moderado';
    END
    ELSE IF @totalAcessos = 0
    BEGIN
        SET @nivelAtividade = 'Pouco ativo (Sem acessos)';
    END
    ELSE
    BEGIN
        SET @nivelAtividade = 'Status indefinido';
    END;
    RETURN @nivelAtividade;
END;
GO


CREATE NONCLUSTERED INDEX IX_ControleAcessos_Cliente_DataEntrada
ON Controle_Acessos (cd_cliente, dt_entrada);
GO
CREATE NONCLUSTERED INDEX IX_Contratos_Cliente_Status_Periodo
ON Contratos (cd_cliente, status, dt_inicio, dt_fim);
GO

SELECT dbo.fn_ObterNivelAtividadeCliente(1, '2023-08-01', '2023-08-31') AS 'Atividade do cliente 1 (Agosto/2023)';

SELECT dbo.fn_ObterNivelAtividadeCliente(2, '2023-08-01', '2023-08-31') AS 'Atividade do cliente 2 (Agosto/2023)';

SELECT dbo.fn_ObterNivelAtividadeCliente(5, '2023-08-01', '2023-09-30') AS 'Atividade do cliente 5 (Ago-Set/2023)';

SELECT dbo.fn_ObterNivelAtividadeCliente(999, '2023-01-01', '2023-12-31') AS 'Atividade do cliente inexistente';

SELECT dbo.fn_ObterNivelAtividadeCliente(1, '2023-12-31', '2023-01-01') AS 'Teste de período inválido';

SELECT
    c.nm_cliente AS 'Nome dos clientes',
    dbo.fn_ObterNivelAtividadeCliente(c.cd_cliente, '2023-08-01', '2023-08-31') AS 'Nível de atividade (Agosto de2023)'
FROM
    Clientes c;