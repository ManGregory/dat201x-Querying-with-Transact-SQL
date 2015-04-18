-- 1.1
select distinct City, StateProvince
from SalesLT.Address

-- 1.2
select top 10 percent p.Name, p.Weight
from SalesLT.Product as p
order by p.Weight desc

-- 1.3
select p.Name, p.Weight
from SalesLT.Product as p
order by p.Weight desc
OFFSET 10 ROWS FETCH NEXT 100 ROWS ONLY

-- 1.1
select p.name, p.color, p.size
from SalesLT.Product p
where p.ProductModelID = 1

-- 1.2
select p.ProductNumber, p.Name
from SalesLT.Product p
where (p.Color in ('black', 'red', 'white')) and p.Size in ('S', 'M')

-- 1.3
select p.ProductNumber, p.Name, p.ListPrice
from SalesLT.Product p
where p.ProductNumber like 'BK-%'

-- 1.4
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product 
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';