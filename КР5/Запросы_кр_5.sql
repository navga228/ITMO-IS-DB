USE AdventureWorks2017;

-- SELECT *
-- FROM Sales.SalesOrderDetail;

-- SELECT Sales.SalesOrderHeader

-- Вывести на экран, для каждого продукта, количество его продаж, 
-- и соотношение числа покупателей этого продукта, к числу покупателей, 
-- купивших товары из категории, к которой относится данный товар. (2 запроса)
SELECT t1.pid, t1.cn AS колво_продаж, ((t2.c * 100) / t3.c) AS q, t2.c, t3.c
FROM (
    SELECT COUNT(ProductID) AS cn, ProductID AS pid
    FROM Sales.SalesOrderDetail
    GROUP BY ProductID
) t1, (
    SELECT COUNT(soh.CustomerID) AS c
    FROM Sales.SalesOrderHeader AS soh JOIN 
    Sales.SalesOrderDetail AS sod 
    ON soh.SalesOrderID = sod.SalesOrderID
    GROUP BY sod.ProductID, soh.CustomerID
) t2, (
    SELECT COUNT(sod.ProductID) AS c
    FROM Sales.SalesOrderDetail AS sod JOIN
    Sales.SalesOrderHeader AS soh
    ON sod.SalesOrderID = soh.SalesOrderID JOIN 
    Production.Product AS p 
    ON sod.ProductID = p.ProductID JOIN 
    Production.ProductSubcategory as psc 
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID JOIN 
    Production.ProductCategory AS pc 
    ON psc.ProductSubcategoryID = pc.ProductCategoryID
    GROUP BY sod.ProductID, pc.ProductCategoryID
) t3

-- Вывести на экран номера покупателей, количество купленных ими товаров, 
-- и количество чеков, которые у них были
-- WITH unit_count(amount, cust_id)
-- AS (
    
-- )
-- SELECT 