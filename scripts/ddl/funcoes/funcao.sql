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