-- 1.1
select UPPER(p.Name), ROUND(p.Weight, 0) as ApproxWeight
from SalesLT.Product p

-- 1.2
select UPPER(p.Name), ROUND(p.Weight, 0) as ApproxWeight, DATENAME(year, p.SellStartDate) as SellStartYear, 
	DATENAME(month, p.SellStartDate) as SellStartMonth
from SalesLT.Product p

-- 1.3
select UPPER(p.Name), ROUND(p.Weight, 0) as ApproxWeight, DATENAME(year, p.SellStartDate) as SellStartYear, 
	DATENAME(month, p.SellStartDate) as SellStartMonth, SUBSTRING(p.ProductNumber, 1, 2) as ProductType
from SalesLT.Product p

-- 1.4
select UPPER(p.Name), ROUND(p.Weight, 0) as ApproxWeight, DATENAME(year, p.SellStartDate) as SellStartYear, 
	DATENAME(month, p.SellStartDate) as SellStartMonth, SUBSTRING(p.ProductNumber, 1, 2) as ProductType
from SalesLT.Product p
where ISNUMERIC(p.Size) = 1

-- 2.1
select c.CompanyName,
	RANK() OVER(ORDER BY so.TotalDue) as RankTotalDue
from SalesLT.Customer c
	join SalesLT.SalesOrderHeader so on so.CustomerId = c.CustomerID

-- 3.1
select p.Name, sum(so.LineTotal)
from SalesLT.Product p
	join SalesLT.SalesOrderDetail so on so.ProductID = p.ProductID
group by p.Name
order by 2 desc

-- 3.2
select p.Name, sum(so.LineTotal)
from SalesLT.Product p
	join SalesLT.SalesOrderDetail so on so.ProductID = p.ProductID
where p.ListPrice > 1000
group by p.Name

-- 3.3
select p.Name, sum(so.LineTotal)
from SalesLT.Product p
	join SalesLT.SalesOrderDetail so on so.ProductID = p.ProductID
group by p.Name
having sum(so.LineTotal) > 20000
order by 2 desc