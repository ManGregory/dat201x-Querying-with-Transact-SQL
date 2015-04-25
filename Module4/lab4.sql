-- 1.1
select c.CompanyName, a.AddressLine1, a.City, 'Billing' as AddressType
from SalesLT.Customer c
	join SalesLT.CustomerAddress ca on ca.CustomerId = c.CustomerId and ca.AddressType = 'Main Office'
	join SalesLT.Address a on a.AddressId = ca.AddressId

-- 1.2
select c.CompanyName, a.AddressLine1, a.City, 'Shipping' as AddressType
from SalesLT.Customer c
	join SalesLT.CustomerAddress ca on ca.CustomerId = c.CustomerId and ca.AddressType = 'Shipping'
	join SalesLT.Address a on a.AddressId = ca.AddressId

-- 1.3
select c.CompanyName, a.AddressLine1, a.City, 'Billing' as AddressType
from SalesLT.Customer c
	join SalesLT.CustomerAddress ca on ca.CustomerId = c.CustomerId and ca.AddressType = 'Main Office'
	join SalesLT.Address a on a.AddressId = ca.AddressId
union all
select c.CompanyName, a.AddressLine1, a.City, 'Shipping' as AddressType
from SalesLT.Customer c
	join SalesLT.CustomerAddress ca on ca.CustomerId = c.CustomerId and ca.AddressType = 'Shipping'
	join SalesLT.Address a on a.AddressId = ca.AddressId
order by CompanyName, AddressType

-- 2.1
select c.CompanyName
from SalesLT.Customer c
	join SalesLT.CustomerAddress ca on ca.CustomerId = c.CustomerId and ca.AddressType = 'Main Office'
	join SalesLT.Address a on a.AddressId = ca.AddressId
except
select c.CompanyName
from SalesLT.Customer c
	join SalesLT.CustomerAddress ca on ca.CustomerId = c.CustomerId and ca.AddressType = 'Shipping'
	join SalesLT.Address a on a.AddressId = ca.AddressId
order by CompanyName, AddressType

-- 2.2
select c.CompanyName
from SalesLT.Customer c
	join SalesLT.CustomerAddress ca on ca.CustomerId = c.CustomerId and ca.AddressType = 'Main Office'
	join SalesLT.Address a on a.AddressId = ca.AddressId
intersect
select c.CompanyName
from SalesLT.Customer c
	join SalesLT.CustomerAddress ca on ca.CustomerId = c.CustomerId and ca.AddressType = 'Shipping'
	join SalesLT.Address a on a.AddressId = ca.AddressId
order by CompanyName