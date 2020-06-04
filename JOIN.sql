
--I can list employees' information that whose is working on product.

SELECT  P.PersonalID,
		P.Name,
		P.LastName, 
		PQ.ProductID,
		PP.ProductName,
		PQ.TotalProduction
		FROM Personal AS P
		JOIN PersonalQuota AS PQ
		ON P.PersonalID= PQ.PersonalID
		JOIN Product AS PP
		ON PP.ProductID=PQ.ProductID
		



