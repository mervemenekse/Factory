
/*
It is a TRANSACTION to increase total production and current quota at the same time. 

When your employee increase their production, you can add only the difference. 
Your total production and your current quota will increased automatically.

So you can add your employee's production amount day to day.

*/


CREATE PROC Update_Production
(
	@PersonalID INT,
	@ProductID VARCHAR(10),
	@TotalProduction INT
)
AS 
BEGIN
BEGIN TRANSACTION
	UPDATE PersonalQuota
	SET TotalProduction= TotalProduction + @TotalProduction
	WHERE PersonalID=@PersonalID
	IF @@ERROR <> 0
ROLLBACK
	UPDATE AnnualProductQuota
	SET CurrentQuota=CurrentQuota + @TotalProduction
	WHERE ProductID=@ProductID
IF @@ERROR <> 0
ROLLBACK 
COMMIT
END;

EXEC Update_Production '5881','313-BLA','5';

SELECT * FROM PersonalQuota;
SELECT * FROM AnnualProductQuota;