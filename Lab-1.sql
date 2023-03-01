--#1 ����� � ������� �� ����� �������� ���������, �� ���� � ������.
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

--#7 ����� � ������� �� ����� �� ������������� ����� ���������, � ������� ���� ��������� � ��������� �� 10 �� 50 ������������.