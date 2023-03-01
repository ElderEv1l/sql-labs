--#1 Найти и вывести на экран названия продуктов, их цвет и размер.
SELECT p.Name, p.Color, p.Size
FROM Production.Product as p

--#2 Найти и вывести на экран названия, цвет и размер таких продуктов, у которых цена более 100.
SELECT p.Name, p.Color, p.Size
FROM Production.Product as p
WHERE p.ListPrice > 100

--#3 Найти и вывести на экран название, цвет и размер таких продуктов, у которых цена менее 100 и цвет Black.
SELECT p.Name, p.Color, p.Size
FROM Production.Product as p
WHERE p.ListPrice < 100 and p.Color = 'Black'

--#4 Найти и вывести на экран название, цвет и размер таких продуктов, у которых цена менее 100 и цвет Black, упорядочив вывод по возрастанию стоимости продуктов.
SELECT p.Name, p.Color, p.Size
FROM Production.Product as p
WHERE p.ListPrice < 100 and p.Color = 'Black'
ORDER BY p.ListPrice ASC

--#5 Найти и вывести на экран название и размер первых трех самых дорогих товаров с цветом Black.
SELECT TOP 3 p.Name, p.Size
FROM Production.Product as p
WHERE p.Color = 'Black'
ORDER BY p.ListPrice DESC

--#6 Найти и вывести на экран название и цвет таких продуктов, для которых определен и цвет, и размер.
SELECT p.Name, p.Color
FROM Production.Product as p
WHERE p.Color is not null and p.Size is not null

--#7 Найти и вывести на экран не повторяющиеся цвета продуктов, у которых цена находится в диапазоне от 10 до 50 включительно
SELECT DISTINCT p.Color
FROM Production.Product as p
WHERE p.Color is not null and p.ListPrice between 10 and 50

--#8 Найти и вывести на экран все цвета таких продуктов, у которых в имени первая буква ‘L’ и третья ‘N’.
SELECT DISTINCT p.Color
FROM Production.Product as p
WHERE p.Name like 'L_N%'

--#9 Найти и вывести на экран названия таких продуктов, которых начинаются либо на букву ‘D’, либо на букву ‘M’, и при этом длина имени – более трех символов.
SELECT p.Name
FROM Production.Product as p
WHERE (p.Name like 'D%' or p.Name like 'M%') and len(p.name) > 3

--#10 Вывести на экран названия продуктов, у которых дата начала продаж – не позднее 2012 года.
SELECT p.Name
FROM Production.Product as p
WHERE datepart(year, p.SellStartDate) <= 2012

--#11 Найти и вывести на экран названия всех подкатегорий товаров.
SELECT p.Name
FROM Production.ProductSubcategory as p

--#12 Найти и вывести на экран названия всех категорий товаров.
SELECT p.Name
FROM Production.ProductCategory as p

--#13 Найти и вывести на экран имена всех клиентов из таблицы Person, у которых обращение (Title) указано как «Mr.».
SELECT p.FirstName
FROM Person.Person as p
WHERE p.Title = 'Mr.'

--#14 Найти и вывести на экран имена всех клиентов из таблицы Person, для которых не определено обращение (Title).
SELECT p.FirstName
FROM Person.Person as p
WHERE p.Title is null
