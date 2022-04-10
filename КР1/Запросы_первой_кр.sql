USE AdventureWorks2017;
-- Вывод всей таблицы
/* SELECT *
FROM Production.Product */


-- Задание 1 
-- Найти и вывести на экран названия продуктов 
-- для которых опредлен цвет но не определен размер
/*SELECT name, Color, Size
FROM Production.Product
WHERE color IS NOT NULL AND Size IS NULL*/

-- Задание 2
-- Найти и вывести на экран названия продуктов у которых номер подкатегории
-- равен или 1 или 3
/*SELECT name, ProductSubcategoryID
FROM Production.Product
WHERE ProductSubcategoryID IN(1, 3)*/

-- Задание 3
-- Найти и вывести на экран названия продуктов у которых цена лежит 
-- в диапазоне от 40 до 300 не включая границы диапазона
/* SELECT name, ListPrice
FROM Production.Product
WHERE ListPrice > 40 AND ListPrice < 300
ORDER BY ListPrice -- Чтоб было наглядно видно правильность запроса */

-- Задание 4
-- Найти и вывести названия продуктов у которых цена меньше 40 или больше 300
/* SELECT name, ListPrice
FROM Production.Product
WHERE ListPrice < 40 OR ListPrice > 300
ORDER BY ListPrice */

-- Задание 5
-- Найти и вывести на экран названия продуктов у которых 
-- цена лежит в диапазоне от 40 до 300 включая границы диапазона
/* SELECT name, ListPrice
FROM Production.Product
WHERE ListPrice BETWEEN 40 AND 300
ORDER BY ListPrice */

-- Задание 6 
-- Найти и вывести на экран названия подкатегорий с номерами 1,3,5
/* SElECT name, ProductSubcategoryID
FROM Production.ProductSubcategory
WHERE ProductSubcategoryID IN(1,3,5) */
/* SELECT Name, ProductSubcategoryID
FROM Production.ProductSubcategory
WHERE ProductSubcategoryID LIKE '[135]' */

-- Задание 7
-- Найти и вывести на экран названия каитегорий с номерами 1,3,7
/* SELECT name, ProductCategoryID
FROM Production.ProductSubcategory
WHERE ProductCategoryID IN(1,3,7) */
/* SELECT Name, ProductCategoryID
FROM Production.ProductSubcategory
WHERE ProductCategoryID LIKE '[137]' */

-- Задание 8
-- Найти и вывести имена клиентов(Таблица Person) 
-- у которых среднее имя(MiddleName) состоит более чем из одной буквы
/* SELECT FirstName
FROM Person.Person
WHERE MiddleName LIKE '[a-z][a-z]%' */

-- Задание 9
-- Найти и вывести названия продуктов у которых третья буква 
-- в названии "u" или "c"
/* SELECT Name
FROM Production.Product
WHERE Name LIKE '__[uc]%'
*/

-- Задание 10
-- Найти и вывести на экран названия продуктов у которых 
-- в названии нет букв a,d,g,k,c
/* SELECT Name
FROM Production.Product
WHERE Name NOT LIKE '%[adgkc]%' */

-- Задание 12
-- Найти и вывести имена клиентов(таблица Person) 
-- у которых Suffix равен "jr" 
/* SELECT FirstName, Suffix
FROM Person.Person
WHERE Suffix = 'jr.' */


