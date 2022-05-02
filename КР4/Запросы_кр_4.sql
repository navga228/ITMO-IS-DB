USE AdventureWorks2017;
-- Вывол таблиц для проверок запросов
-- SELECT *
-- FROM Sales.SalesOrderDetail; 

-- SELECT *
-- FROM Production.Product;

-- Запросы лабы

-- Задание 1
-- Найти название и айдишники продуктов, у которых цвет совпадает 
-- с такими товарами цена на которые была меньше 5000
-- Вариант 1
-- SELECT Name, ProductID
-- FROM Production.Product
-- WHERE Color IN 
-- (
--     SELECT Color
--     FROM Sales.SalesOrderDetail AS sod JOIN Production.Product AS p
--     ON sod.ProductID = p.ProductID
--     WHERE UnitPrice < 5000
-- )
-- ORDER BY 2;

-- -- Вариант 2
-- select [Name], ProductID
-- from Production.product
-- where color in
-- (select Color
-- from Production.product
-- where ListPrice < 5000)
-- ORDER BY 2

-- Задание 2
-- Вывести на экран товары и ид у которых цвет совпадает с цветом самого дорогого товара
-- SELECT Name, ProductID
-- FROM Production.Product
-- WHERE Color IN 
-- (
--     SELECT Color
--     FROM Production.Product 
--     WHERE ListPrice = (SELECT MAX(ListPrice) FROM Production.Product)
-- )

-- Задание 3
-- Вывести названия товаров, чей цвет совпадает с цветом одного из товаров, чья цена меньше 400
-- SELECT Name, ProductID
-- FROM Production.Product
-- WHERE Color = ANY 
-- (
--     SELECT Color
--     FROM Production.Product
--     WHERE ListPrice < 400
-- )

-- Задание 4
-- Найти название подкатегории где содержится самый дорогой товар с красным цветом
-- SELECT Name, ProductSubcategoryID
-- FROM Production.ProductSubcategory
-- WHERE ProductSubcategoryID =
-- (
--     SELECT TOP 1 ProductSubcategoryID
--     FROM Production.Product 
--     WHERE Color = 'Red' and ListPrice = (SELECT MAX(ListPrice) FROM Production.Product)
-- )