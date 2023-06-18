select BusinessEntityID,FirstName,LastName,MiddleName,ModifiedDate from person.person
where ModifiedDate > '2000-12-29'


select BusinessEntityID,FirstName,LastName,MiddleName,ModifiedDate from person.person
where not ModifiedDate between '2000-12-01' and '2000-12-31'


select name,ProductID from Production.Product
where name like 'chain%'


select BusinessEntityID,FirstName,LastName,MiddleName,ModifiedDate from person.person
where  MiddleName like '%E%' or MiddleName like  '%B%'


select SalesOrderID,OrderDate,TotalDue from Sales.SalesOrderHeader
where OrderDate between '2011-09-01' and '2011-09-30' and  TotalDue >=1000


select SalesOrderID from Sales.SalesOrderHeader
where SalesPersonID=279 or TerritoryID=6 and TotalDue>1000


select ProductID,Name,Color from Production.Product
where  Color <>'blue'
--8

select BusinessEntityID,FirstName,LastName,MiddleName from person.person
ORDER BY LastName,FirstName,MiddleName


select CONCAT(AddressLine1,'(',City,PostalCode,')') from Person.Address


update Production.Product
set Color='nocolor'
where Color IS NULL



update Production.Product
set Color='green'
where color='nocolor'
SELECT concat(Name,':',Color) FROM Production.Product



select DIFFERENCE(MaxQty,MinQty)as 'Difference',SpecialOfferID,Description from Sales.SpecialOffer


update Sales.SpecialOffer
set MaxQty=10
where MaxQty is null
select MaxQty*DiscountPct as 'discount' ,SpecialOfferID,Description from Sales.SpecialOffer



select SUBSTRING(AddressLine1,1,10) as 'Address'
from Person.Address



select DATEDIFF(DAY,OrderDate,ShipDate) as 'days taken',SalesOrderID,OrderDate,ShipDate from Sales.SalesOrderHeader


select DATEADD(MONTH,6,OrderDate) as 'New Order Date',OrderDate from Sales.SalesOrderHeader

select YEAR(OrderDate),SalesOrderID,OrderDate from Sales.SalesOrderHeader

SELECT FLOOR(RAND()*(10-5+1)+5);

select SalesOrderID,SalesOrderID from Sales.SalesOrderHeader
where not ModifiedDate between '2001-12-01' and '2001-12-31'


SELECT * FROM Sales.SalesOrderHeader
ORDER BY MONTH(OrderDate),year(OrderDate)














-----------------------DAY 3

select count(*) from Sales.Customer

select MIN(ListPrice) as'MINIMUM',MAX(ListPrice) as 'MAXIMUM',AVG(ListPrice) as 'AVERAGE' from Production.Product

select SalesOrderID,count(OrderQty) as 'Total' from Sales.SalesOrderDetail
group by SalesOrderID


select SalesOrderID,count(OrderQty) as 'Total' from Sales.SalesOrderDetail
group by SalesOrderID

select OrderDate,CustomerID,count(SalesOrderID) as 'Total' from Sales.SalesOrderHeader
group by CustomerID,OrderDate

select SalesOrderID,sum(LineTotal)  from Sales.SalesOrderDetail
group by (SalesOrderID)
having sum(LineTotal)>1000



select productID,count(ProductID)  from Sales.SalesOrderDetail
group by (ProductID)
having count(ProductID)>1


select ProductID,sum(OrderQty)as 'Total_Quantities'  from Sales.SalesOrderDetail
group by (ProductID)


