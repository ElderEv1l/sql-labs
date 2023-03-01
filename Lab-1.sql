--#1 ����� � ������� �� ����� �������� ���������, �� ���� � ������.*/
SELECT p.Name, p.Color, p.Size
FROM Production.Product as p

--#2 ����� � ������� �� ����� ��������, ���� � ������ ����� ���������, � ������� ���� ����� 100.
SELECT p.Name, p.Color, p.Size
FROM Production.Product as p
WHERE p.ListPrice > 100

--#3 ����� � ������� �� ����� ��������, ���� � ������ ����� ���������, � ������� ���� ����� 100 � ���� Black.
SELECT p.Name, p.Color, p.Size
FROM Production.Product as p
WHERE p.ListPrice < 100 and p.Color = 'Black'

--#4 ����� � ������� �� ����� ��������, ���� � ������ ����� ���������, � ������� ���� ����� 100 � ���� Black, ���������� ����� �� ����������� ��������� ���������.
SELECT p.Name, p.Color, p.Size
FROM Production.Product as p
WHERE p.ListPrice < 100 and p.Color = 'Black'
ORDER BY p.ListPrice ASC

--#5 ����� � ������� �� ����� �������� � ������ ������ ���� ����� ������� ������� � ������ Black.
SELECT TOP 3 p.Name, p.Size
FROM Production.Product as p
WHERE p.Color = 'Black'
ORDER BY p.ListPrice DESC

--#6 ����� � ������� �� ����� �������� � ���� ����� ���������, ��� ������� ��������� � ����, � ������.
SELECT p.Name, p.Color
FROM Production.Product as p
WHERE p.Color is not null and p.Size is not null

--#7 ����� � ������� �� ����� �� ������������� ����� ���������, � ������� ���� ��������� � ��������� �� 10 �� 50 ������������.SELECT DISTINCT p.ColorFROM Production.Product as pWHERE p.Color is not null and p.ListPrice between 10 and 50--#8 ����� � ������� �� ����� ��� ����� ����� ���������, � ������� � ����� ������ ����� �L� � ������ �N�.SELECT DISTINCT p.ColorFROM Production.Product as pWHERE p.Name like 'L_N%'--#9 ����� � ������� �� ����� �������� ����� ���������, ������� ���������� ���� �� ����� �D�, ���� �� ����� �M�, � ��� ���� ����� ����� � ����� ���� ��������.SELECT p.NameFROM Production.Product as pWHERE (p.Name like 'D%' or p.Name like 'M%') and len(p.name) > 3--#10 ������� �� ����� �������� ���������, � ������� ���� ������ ������ � �� ������� 2012 ����.SELECT p.NameFROM Production.Product as pWHERE datepart(year, p.SellStartDate) <= 2012--#11 ����� � ������� �� ����� �������� ���� ������������ �������.SELECT p.NameFROM Production.ProductSubcategory as p--#12 ����� � ������� �� ����� �������� ���� ��������� �������.SELECT p.NameFROM Production.ProductCategory as p--#13 ����� � ������� �� ����� ����� ���� �������� �� ������� Person, � ������� ��������� (Title) ������� ��� �Mr.�.SELECT p.FirstNameFROM Person.Person as pWHERE p.Title = 'Mr.'--#14 ����� � ������� �� ����� ����� ���� �������� �� ������� Person, ��� ������� �� ���������� ��������� (Title).SELECT p.FirstNameFROM Person.Person as pWHERE p.Title is null