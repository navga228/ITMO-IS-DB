use AdventureWorks2017;

/* Найти название продуктов и название подкатегорий этих продуктов, 
у которых отпускная цена больше 100, не включая случаи, 
когда продукт не относится ни к какой подкатегории. */

/* SELECT P.Name, PSC.Name, p.ProductSubcategoryID, PSC.ProductSubcategoryID, ListPrice 
FROM [Production].[Product] AS P INNER JOIN
[Production].[ProductSubcategory] AS PSC
ON P.ProductSubcategoryID=PSC.ProductSubcategoryID
WHERE [ListPrice]>100
ORDER BY ListPrice ASC */

-- Задание 1 
-- Вывести названия категорий товаров, количество продуктов в которых больше 20
/* SELECT pc.Name, COUNT(*) AS Products_qty
FROM Production.Product p JOIN Production.ProductSubcategory psc
ON psc.ProductSubcategoryID = p.ProductSubcategoryID 
JOIN Production.ProductCategory pc
ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
HAVING COUNT(*) > 20; */

-- Задание 2 
-- Получить названия первых двух категорий товаров из упорядоченного по возрастанию  
-- количества товаров в категории списка
/* SELECT TOP 2 pc.Name, COUNT(*)
FROM Production.Product p JOIN Production.ProductSubcategory psc
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc
ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.ProductCategoryID, pc.Name
ORDER BY COUNT(*); */

-- Задание 3
-- Найти названия товаров, которые были проданы хотя бы один раз
/* SELECT p.Name, COUNT(*)
FROM Production.Product p JOIN Sales.SalesOrderDetail s
ON p.ProductID = s.ProductID
GROUP BY s.ProductID, p.Name; */
-- HAVING COUNT(*) >= 1 Это условие не обязательно тк всегда выполняется 

-- Задание 4 
-- Найти названия товаров, которые не были проданы ни разу
-- Заметьте интресныф момент пропажи 
/* SELECT p.ProductID, s.ProductID
FROM Production.Product p LEFT JOIN Sales.SalesOrderDetail s
ON p.ProductID = s.ProductID
WHERE s.ProductID IS NULL */

-- Задание 5
-- Вывести на экран список товаров, названия, упорядоченный по количеству продаж, по возрастанию
/* SELECT p.Name, COUNT(*)
FROM Production.Product AS p
JOIN Sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
GROUP BY sod.ProductID, p.Name
ORDER BY COUNT(*)  */

-- Задание 6
-- Вывести на экран первых три товара с наибольшим количеством продаж
/* SELECT TOP 3 p.Name, COUNT(*)
FROM Production.Product AS p
JOIN Sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
GROUP BY sod.ProductID, p.Name
ORDER BY COUNT(*) DESC */

-- Задание 7
-- Вывести на экран список категорий, названия, упорядоченный по количеству 
-- продаж товаров этих категорий, по возрастанию
/* SELECT pc.ProductCategoryID, pc.Name, COUNT(*)
FROM Production.Product AS p 
JOIN Sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
JOIN Production.ProductSubcategory AS psc 
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory AS pc 
ON pc.ProductCategoryID = psc.ProductCategoryID
GROUP BY pc.ProductCategoryID, pc.Name
ORDER BY COUNT(*) */

-- Задание 8
-- Вывести список поставщиков, названия вендоров, упорядоченный по количеству 
-- поставляемых товаров, по возрастанию
/* SELECT v.Name, COUNT(*)
FROM Purchasing.Vendor v
JOIN Purchasing.ProductVendor pv 
On v.BusinessEntityID = pv.BusinessEntityID
GROUP BY pv.BusinessEntityID, v.Name
ORDER BY COUNT(*) */

-- Задание 9
-- Получить названия первых двух категорий товаров из упорядоченного
-- по возрастанию количества товаров в категории списка n
/* SELECT TOP 2 pc.Name, COUNT(*)
FROM Production.Product AS p 
JOIN Production.ProductSubcategory AS psc 
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory AS pc 
ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.ProductCategoryID, pc.Name
ORDER BY COUNT(*) */

-- Задание 10 
-- Найти сколько различных размеров товаров приходится на каждую категорию товаров
/* SELECT pc.Name, COUNT(DISTINCT [Size])
FROM Production.Product AS p
JOIN Production.ProductSubcategory AS psc 
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory AS pc 
On psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.ProductCategoryID, pc.Name */

-- Найти название товаров, которые были куплены или три, или пять раз
/* SELECT p.Name, COUNT(*)
FROM Production.Product AS p
JOIN Sales.SalesOrderDetail AS sod 
ON p.ProductID = sod.ProductID
GROUP BY sod.ProductID, p.Name
HAVING COUNT(*) IN(3,5) */

-- Задание 11 
-- Подкатегории, которые больше 5…. (Неполное задание)
/* select p.Name,count(*)а
from Production.Product a join
Production.ProductSubcategory p
on a.ProductSubcategoryID = p.ProductSubcategoryID
group by p.Name
having count(*) > 5 */

-- Задание 12
-- Найти названия тех категорий товаров, где количество товаров более 20
/* SELECT pc.Name, COUNT(*)
FROM Production.Product AS P
JOIN Production.ProductSubcategory AS psc 
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory As pc
ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.ProductCategoryID, pc.Name
HAVING COUNT(*) > 20 */

-- Задание 13
-- Найти название товаров синего цвета, купленных ровно два раза, 
-- и вывести категории к которым относится товар.
/* SELECT p.Name, pc.Name, COUNT(*)
FROM Production.Product AS p
JOIN Production.ProductSubcategory AS psc
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory AS pc
ON psc.ProductCategoryID = pc.ProductCategoryID
JOIN Sales.SalesOrderDetail AS s
ON p.ProductID = s.ProductID
WHERE p.Color = 'Blue'
GROUP By s.ProductID, pc.Name, p.Name
HAVING COUNT(*) = 2 */
















