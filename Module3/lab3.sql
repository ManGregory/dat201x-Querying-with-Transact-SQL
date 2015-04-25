use AdventureWorksLT;

-- 1.1
select c.CompanyName, so.SalesOrderId, so.TotalDue
from SalesLT.Customer c
	join SalesLT.SalesOrderHeader so on so.CustomerId = c.CustomerId

-- 1.2
select 
	c.CompanyName, so.SalesOrderId, so.TotalDue, a.AddressLine1, a.AddressLine2, a.City, a.StateProvince, a.PostalCode, a.CountryRegion
from SalesLT.Customer c
	join SalesLT.SalesOrderHeader so on so.CustomerId = c.CustomerId 
	join SalesLT.CustomerAddress ca on ca.CustomerId = c.CustomerId and ca.AddressType = 'Main Office'
	join SalesLT.Address a on a.AddressId = ca.AddressId

-- 2.1
select
	c.CompanyName, c.FirstName, c.LastName, so.SalesOrderId, so.TotalDue
from SalesLT.Customer c
	left join SalesLT.SalesOrderHeader so on so.CustomerId = c.CustomerId 
order by so.SalesOrderId desc

-- 2.2
select c.CompanyName, c.FirstName, c.LastName, c.Phone
from SalesLT.Customer c
	left join SalesLT.CustomerAddress ca on ca.CustomerID = c.CustomerId
where ca.CustomerId is null

-- 2.3
select c.CustomerId, p.ProductId
from SalesLT.SalesOrderDetail sod
	full outer join SalesLT.Product p on sod.ProductId = p.ProductId
	full join SalesLT.SalesOrderHeader soh on sod.SalesOrderID = soh.SalesOrderID
	full join SalesLT.Customer c on c.CustomerId = soh.CustomerId
where (c.CustomerId is null) or (p.ProductId is null)
