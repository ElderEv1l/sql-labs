--#1 Найти и вывести на экран количество товаров каждого цвета, исключив из поиска товары, цена которых меньше 30. 
SELECT p.Color, COUNT(*) as 'Amount'
FROM Production.Product as p
WHERE p.ListPrice >= 30
GROUP BY p.Color

--#2 Найти и вывести на экран список, состоящий из цветов товаров, таких, что минимальная цена товара данного цвета более 100.
SELECT p.Color
FROM Production.Product as p
GROUP BY p.Color
HAVING MIN(p.ListPrice) > 100

--#3 Найти и вывести на экран номера подкатегорий товаров и количество товаров в каждой категории.
SELECT p.ProductSubcategoryID, COUNT(*) as 'Amount'
FROM Production.Product as p
GROUP BY p.ProductSubcategoryID

--#4 Найти и вывести на экран номера товаров и количество фактов продаж данного товара (используется таблица SalesORDERDetail).
SELECT s.ProductID, COUNT(*) as 'Amount'
FROM Sales.SalesOrderDetail as s
GROUP BY s.ProductID

--#5 Найти и вывести на экран номера товаров, которые были куплены более пяти раз.
SELECT s.ProductID
FROM Sales.SalesOrderDetail as s
GROUP BY s.ProductID
HAVING COUNT(*) > 5

--#6 Найти и вывести на экран номера покупателей, CustomerID, у которых существует более одного чека, SalesORDERID, с одинаковой датой
SELECT DISTINCT s.CustomerID
FROM Sales.SalesOrderHeader as s
GROUP BY s.CustomerID, s.OrderDate
HAVING COUNT(s.OrderDate) > 1

--#7 Найти и вывести на экран все номера чеков, на которые приходится более трех продуктов.
SELECT s.SalesOrderID
FROM Sales.SalesOrderDetail as s
GROUP BY s.SalesOrderID
HAVING COUNT(s.ProductID) > 3

--#8 Найти и вывести на экран все номера продуктов, которые были куплены более трех раз.
SELECT s.ProductID
FROM Sales.SalesOrderDetail as s
GROUP BY s.ProductID
HAVING COUNT(s.ProductID) > 3

--#9 Найти и вывести на экран все номера продуктов, которые были куплены или три или пять раз
SELECT s.ProductID
FROM Sales.SalesOrderDetail as s
GROUP BY s.ProductID
HAVING COUNT(s.ProductID) = 3 or COUNT(s.ProductID) = 5

--#10 Найти и вывести на экран все номера подкатегорий, в которым относится более десяти товаров.
SELECT p.ProductSubcategoryID
FROM Production.Product as p
GROUP BY p.ProductSubcategoryID
HAVING COUNT(*) > 10

--#11 Найти и вывести на экран номера товаров, которые всегда покупались в одном экземпляре за одну покупку.
SELECT s.ProductID
FROM Sales.SalesOrderDetail as s
GROUP BY s.ProductID
HAVING MAX(s.OrderQty) = 1

--#12 Найти и вывести на экран номер чека, SalesORDERID, на который приходится с наибольшим разнообразием товаров купленных на этот чек.
SELECT TOP(1) s.SalesOrderID
FROM Sales.SalesOrderDetail as s
GROUP BY s.SalesOrderID
ORDER BY SUM(s.OrderQty) DESC

--#13 Найти и вывести на экран номер чека, SalesORDERID с наибольшей суммой покупки, исходя из того, что цена товара – это UnitPrice, а количество конкретного товара в чеке – это ORDERQty.
SELECT TOP(1) s.SalesOrderID
FROM Sales.SalesOrderDetail as s
GROUP BY s.SalesOrderID
ORDER BY SUM(s.OrderQty * s.UnitPrice) DESC

--#14 Определить количество товаров в каждой подкатегории, исключая товары, для которых подкатегория не определена, и товары, у которых не определен цвет.
SELECT p.ProductSubcategoryID, COUNT(*) as 'Amount'
FROM Production.Product as p
WHERE p.Color is not null and p.ProductSubcategoryID is not null
GROUP BY p.ProductSubcategoryID

--#15 Получить список цветов товаров в порядке убывания количества товаров данного цвета
SELECT p.Color
FROM Production.Product as p
GROUP BY p.Color
ORDER BY COUNT(*) DESC

--#16 Вывести на экран ProductID тех товаров, что всегда покупались в количестве более 1 единицы на один чек, при этом таких покупок было более двух.
SELECT s.ProductID
FROM Sales.SalesOrderDetail as s
GROUP BY s.ProductID
HAVING MIN(s.OrderQty) > 1 and COUNT(*) > 2

