CREATE TRIGGER trg_RegistraDataInativacaoContrato
ON dbo.Contratos
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF (TRIGGER_NESTLEVEL() > 1)
    BEGIN
        RETURN;
    END;

    IF UPDATE(status)
    BEGIN
        UPDATE
            C
        SET
            C.dt_ultima_inativacao = GETDATE()
        FROM
            dbo.Contratos AS C
        JOIN
            inserted AS i ON C.cd_contrato = i.cd_contrato 
        JOIN
            deleted AS d ON i.cd_contrato = d.cd_contrato
        WHERE
            d.status = 'ATIVO' AND i.status = 'INATIVO';
    END
END;
GO