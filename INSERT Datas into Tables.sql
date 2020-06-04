
/* While I insert datas, I used 'INSERT INTO' command and stored procedure. 
	You can choose the easiest to you. */

/* We need columns' information to create procedure. 
I create a procedure to reach that information of each tables easily.*/

SELECT	TABLE_NAME,
		COLUMN_NAME, 
		DATA_TYPE, 
		CHARACTER_MAXIMUM_LENGTH, 
		IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Product'

--******************************************************************

CREATE PROC SHOW
(
	@TableName VARCHAR(50)
)
AS 
BEGIN

SELECT TABLE_NAME,
		COLUMN_NAME, 
		DATA_TYPE, 
		CHARACTER_MAXIMUM_LENGTH, 
		IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME =@TableName
END;

--******************************************************************

SHOW 'Product';


--******************************************************************


CREATE PROC ProductADD
(
	@ProductID VARCHAR(10),
	@ProductName VARCHAR(20)
)
AS 
BEGIN 
INSERT INTO Product(ProductID,ProductName) VALUES (@ProductID,@ProductName)
END;

--******************************************************************

ProductADD '313-BLA','CEKET-Blazer';
ProductADD '313-CLA','CEKET-Classic';
ProductADD '313-SPR','CEKET-Spor';
ProductADD '314-G360','GÖMLEK-360';
ProductADD '314-DSL','GÖMLEK-Desenli';
ProductADD '314-KK','GÖMLEK-KýsaKollu';
ProductADD '314-NIRON','GÖMLEK-NonIRON';
ProductADD '315-COT','PANTOLON-Kot';
ProductADD '315-KUM','PANTOLON-Kumas';
ProductADD '315-CSL','PANTOLON-Classic';
ProductADD '315-NIRON','PANTOLON-NonIRON';
ProductADD '315-P360','PANTOLON-360';

SELECT * FROM Product



--******************************************************************

SHOW 'Personal';

INSERT INTO Personal VALUES 
(5881,'Þengül','TAMTELÜN'),
(7538,'Sude','KAMURAN'),
(1694,'Ecrin','MÜRSEL'),
(5772,'Ömer Halis','KÜÇÜKALEMDAR'),
(2010,'Hiranur','UYAROÐLU'),
(8019,'Yunus','FEREK'),
(2602,'Cihan','KARADELÝ'),
(7262,'Fýrat','ÝRKÝN'),
(3884,'Elif','GÜLTEPE'),
(8247,'Sena','ÇIÐDEM'),
(2181,'Þenol','ERZNOÐLU'),
(2482,'Leyla','ENGÝNKAYA'),
(1280,'Helin','ÖZMEN'),
(7906,'Kenan','BACANAK'),
(7454,'Kumsal','DURA'),
(2565,'Yýlmaz','KÖKLÜ'),
(3075,'Ceyda','KAYIM'),
(3306,'Deniz','BÝLGE'),
(2522,'Cansel','GÜLLER'),
(4624,'Erdem','BUGDAYLI'),
(7673,'Þengül','ADACAN'),
(4102,'Savaþ','GÜNAYDI'),
(6520,'Baran','SARPAL'),
(1896,'Neslihan','KARAKÖSE'),
(7514,'Berkay','KOÇAK'),
(7123,'Birgül','ACAR'),
(2853,'Özlem','ÇAVDARCI'),
(1767,'Sefa','DORUK'),
(5127,'Beyza','AKSU'),
(6971,'Ýrfan','KÝLÝMCÝ');


SELECT * FROM Personal


--******************************************************************
SHOW 'PersonalQuota';

INSERT INTO PersonalQuota VALUES
(5881,'313-BLA',4711),
(7538,'313-BLA',4567),
(1694,'313-BLA',4802),
(5772,'313-BLA',4413),
(2010,'313-CLA',4622),
(8019,'313-CLA',4591),
(2602,'313-CLA',4345),
(7262,'313-CLA',4483),
(3884,'313-CLA',4705),
(8247,'313-SPR',4196),
(2181,'313-SPR',4655),
(2482,'313-SPR',4720),
(1280,'313-SPR',4597),
(7906,'314-DSL',9115),
(7454,'314-DSL',8897),
(2565,'314-G360',8420),
(3075,'314-G360',9243),
(3306,'314-KK',8709),
(2522,'314-KK',9178),
(4624,'314-NIRON',9225),
(7673,'315-COT',6766),
(4102,'315-COT',6940),
(6520,'315-KUM',6417),
(1896,'315-KUM',6690),
(7514,'315-CSL',7074),
(7123,'315-CSL',7050),
(2853,'315-NIRON',6744),
(1767,'315-NIRON',6945),
(5127,'315-P360',6895),
(6971,'315-P360',6910);

SELECT * FROM PersonalQuota

--******************************************************************


--With this  part, we find the answer of one of the questions. 


SHOW 'AnnualProductQuota';



/*  I create procedure, but the current quota is determined 
	by the total number of products entered.  */

CREATE PROC QuotaADD
(
	@ProductID VARCHAR(20),
	@AnnualExpectedQuota INT
)
AS
BEGIN
DECLARE @total INT 
SET @total =(SELECT SUM(TotalProduction) FROM PersonalQuota WHERE ProductID=@ProductID);
INSERT INTO AnnualProductQuota(ProductID,AnnualExpectedQuota,CurrentQuota)
VALUES (@ProductID,@AnnualExpectedQuota,@total)
END;


QuotaADD '313-BLA',18432;
QuotaADD '313-CLA',23040;
QuotaADD '313-SPR',13824;
QuotaADD '314-DSL',17280;
QuotaADD '314-G360',17280;
QuotaADD '314-KK',17280;
QuotaADD '314-NIRON',8640;
QuotaADD '315-COT',13824;
QuotaADD '315-KUM',13824;
QuotaADD '315-CSL',13824;
QuotaADD '315-NIRON',13824;
QuotaADD '315-P360',13824;


SELECT * FROM AnnualProductQuota;
