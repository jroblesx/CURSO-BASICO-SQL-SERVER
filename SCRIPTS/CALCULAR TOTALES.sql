--CALCULAR TOTALES
UPDATE SELL SET CASH = BASE.TOTAL, TOTAL= BASE.TOTAL
FROM
(SELECT 
S.ID SELL,
(SELECT SUM(Q * PRODUCT.PRICE) FROM OPERATION
INNER JOIN PRODUCT ON
OPERATION.PRODUCT_ID = PRODUCT.ID
WHERE OPERATION.SELL_ID = S.ID) TOTAL
FROM SELL S) BASE
WHERE SELL.ID = BASE.SELL
