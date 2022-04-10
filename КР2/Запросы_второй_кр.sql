USE AdventureWorks2017;

-- Задание 1 
-- Найти все товары их PRoductID которые были куплены более чем на три чека
/* SELECT ProductID, COUNT(SalesOrderID) AS Количество_чеков
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING COUNT(SalesOrderID) > 3 */

-- Задаание 2
-- Найти все цвета товаров такие что товаров этого не менее двух и не более 5 
-- в данном магазине
/* SELECT Color, COUNT(*)
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY Color
HAVING COUNT(ProductID) >= 2 AND COUNT(ProductID) < 5 */

-- Задание 3
-- Найти номера подкатегорий товаров такие что существует не менее двух товаров
-- с цветом Red в этой подкатегории
/* SELECT ProductSubcategoryID
FROM Production.Product 
WHERE ProductSubcategoryID IS NOT NULL AND Color = 'Red'
GROUP BY ProductSubcategoryID
HAVING COUNT(*) >= 2 */

-- Задание 4
-- Найти товары которыке были куплены более трех раз
-- при этом цена товара была более 100
/* SELECT ProductID, MIN(UnitPrice)
FROM Sales.SalesOrderDetail
WHERE UnitPrice > 100
GROUP BY ProductID
HAVING COUNT(SalesOrderDetailID) > 3
ORDER BY 2 */

-- Задание 5 
-- Вывести на экран список размеров товаров отсортированный по убыванию 
-- количества красных товаров этого размера
/* SELECT Size, COUNT(Color)
FROM Production.Product
WHERE Color = 'Red'
GROUP BY Size
ORDER BY COUNT(Color) DESC */

-- Задание 6
-- Найти все размеры товаров таких что товаров этого размера более 10
/* SELECT Size, COUNT(*)
FROM Production.Product
GROUP BY Size
HAVING COUNT(*) > 10 */

-- Задание 7 
-- Найти самый продаваемый товар его ProductID из числа тех чья цена продажи
-- UnitPrice не превышает 100
/* SELECT TOP 3 ProductID, SUM(OrderQty)
FROM Sales.SalesOrderDetail
WHERE UnitPrice <= 100
GROUP BY ProductID
ORDER BY SUM(OrderQty) DESC;
-- Для интреса просмотр самого продаваемого товара
SELECT *
FROM Production.Product
WHERE ProductID = '712' */

-- Задание 8 
-- Найти номер подкатегории товаров с наибольшим
-- разнообразием цветов товаров в ней
/* SELECT TOP 1 WITH TIES ProductSubcategoryID, COUNT(DISTINCT Color) AS Color_count
FROM Production.Product
GROUP BY ProductSubcategoryID
ORDER BY COUNT(DISTINCT Color) DESC; */

-- Задание 9 
-- Найти список товаров ProductID которые продавались на один чек в 
-- количестве OrderQty менее 3 штук за раз при этом были куплены более 
-- чем на три разных чека
/* SELECT ProductID, COUNT(SalesOrderDetailID)
FROM Sales.SalesOrderDetail
WHERE OrderQty < 3
GROUP BY ProductID 
HAVING COUNT(SalesOrderDetailID) > 3 */

-- Задание 10 
-- Вывести на экран список номеров категорий ProductCategoryID с наибольшим
-- количеством подкатегорий (у категории велосипедов есть подкатегории 
-- напрмер горный или спортивный)
/* SELECT ProductCategoryID, COUNT(*)
FROM Production.ProductSubcategory
GROUP BY ProductCategoryID
ORDER BY COUNT(*) DESC; */

-- Задание 11 
-- Вывести номера подкатегорий ProductSubcategoryID на которые приходится более
-- 5 товаров
/* SELECT ProductSubcategoryID, COUNt(ProductSubcategoryID)
FROM Production.Product
GROUP BY ProductSubcategoryID
HAVING COUNT(*) > 5
ORDER BY 2 DESC */

-- Задание 12
-- Вывести номера подкатегорий ProductSubcategoryID на которые приходится более 
-- 5 товаров с цветом Red
/* SELECT ProductSubcategoryID, COUNT(*) AS Product_qty
FROM Production.Product
WHERE Color = 'Red'
GROUP BY ProductSubcategoryID
HAVING COUNT(*) > 5 */
