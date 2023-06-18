select t1.JobTitle as 'JobTitle',t1.BirthDate as 'Birth date', t2.FirstName as 'First Name',t2.MiddleName as 'Mddle Name',t2.LastName as 'Last name'
from HumanResources.Employee as t1
join Person.Person as t2
on t1.BusinessEntityID=t2.BusinessEntityID



select t2.FirstName as 'First Name',t2.MiddleName as 'Mddle Name',t2.LastName as 'Last name', t1.CustomerID as 'Customer ID',t1.StoreID as 'Store ID',t1.TerritoryID
from Sales.Customer as t1
join Person.Person as t2
on t2.BusinessEntityID=t1.PersonID



select t1.SalesOrderID as 'SAlE ID',t2.SalesQuota as 'Sales Quota',t2.Bonus as 'Bonus'
from Sales.SalesOrderHeader as t1
join Sales.SalesPerson as t2
on t2.BusinessEntityID=t1.SalesPersonID and not t2.SalesQuota is null

select t2.Color as 'color',t2.Size as 'size' , t1.CatalogDescription as 'Description'
from Production.ProductModel as t1
join Production.Product as t2
on t1.ProductModelID=t2.ProductModelID and not t1.CatalogDescription is null

select t1.ProductID,t1.Name ,t2.SalesOrderID 
from Sales.SalesOrderDetail as t2
left join Production.Product as t1
on t1.ProductID=t2.ProductID

create table emp.temp12(
productid int,
name varchar(30),
color varchar(10))

select * from emp.temp12
insert into emp.temp12(productid,name,color)
 select ProductID,Name,Color from Production.Product where Color='red'





