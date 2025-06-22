CREATE PROCEDURE Inativar_Contratos_Vencidos
AS
BEGIN
    UPDATE Contratos
    SET status = 'INATIVO'
    WHERE dt_fim < CAST(GETDATE() AS DATE) AND status = 'ATIVO';
END