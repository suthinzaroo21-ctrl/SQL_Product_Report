--SalesAnalytics, Sale transcation, Saleperson, Customer, Region, Product
/*alter view dim_Product as
Select 
	PP.ProductID,
	PP.Name ProductName,
	CASE PP.MakeFlag WHEN 0 THEN 'Purchased Item' ELSE 'Manufactured Item' END AS MakeFlag,
	CASE PP.FinishedGoodsFlag WHEN 0 THEN 'Not Salesable Item' ELSE 'Salesable Item' END AS FinishedGoodsFlag,
	PP.SafetyStockLevel, PP.ReorderPoint, PP.StandardCost, PP.ListPrice,
	PU.Name SizeUnitMeasure, PUU.Name WeightUnitMeasure,
	PP.ProductSubcategoryID, PS.Name ProductSubcategoryName,
	PS.ProductCategoryID, PC.Name ProductCategoryName,
	PP.ProductModelID, PM.Name ProductModelName
from Production.Product PP 
left join Production.ProductSubcategory PS on PP.ProductSubcategoryID = PS.ProductSubcategoryID
left join Production.ProductCategory PC on PS.ProductCategoryID = PC.ProductCategoryID
left join Production.UnitMeasure PU on PP.SizeUnitMeasureCode = PU.UnitMeasureCode
left join Production.UnitMeasure PUU on PP.WeightUnitMeasureCode = PUU.UnitMeasureCode
left join Production.ProductModel PM on PP.ProductModelID = PM.ProductModelID 
where pp.productsubcategoryid is not null */

/* 
Select BusinessEntityID,
count(*)
from Person.BusinessEntityAddress
group by BusinessEntityID
having count(*) > 1 */


/*create view dim_address as
Select 
	bea.AddressID,
	pa.AddressLine1 AddressLine,
	pa.City,
	pa.StateProvinceID, sp.StateProvinceCode, sp.Name StateProvinceName, 
	sp.TerritoryID, st.Name TerritoryName, 
	sp.CountryRegionCode, cr.Name Country, st.[Group] Continent,
	pa.PostalCode,
	bea.AddressTypeID, at.Name AddressTypeName
from Person.BusinessEntityAddress BEA
left join Person.address PA on bea.AddressID = pa.AddressID
left join person.AddressType at on bea.AddressTypeID = at.AddressTypeID
left join person.StateProvince sp on pa.StateProvinceID = sp.StateProvinceID
left join sales.SalesTerritory st on sp.TerritoryID = st.TerritoryID
left join person.CountryRegion cr on sp.CountryRegionCode = cr.CountryRegionCode */

/*Select * From Sales.Customer where customerID = '30118'
Select * From person.Person where BusinessEntityID ='1993'*/

/* create view dim_Customer as
Select 
	sc.CustomerID, sc.PersonID,
	concat(FirstName,' ',MiddleName,' ',LastName) CustomerName,
	sc.StoreID, ss.Name StoreName,
	sc.TerritoryID, st.name TerritoryName, 
	st.CountryRegionCode, cr.Name Country, st.[Group] Continent,
	pp.PersonType, ea.EmailAddress
from Sales.Customer SC
left join person.person pp on sc.PersonID = pp.BusinessEntityID
left join sales.SalesTerritory st on sc.TerritoryID = st.TerritoryID
left join person.CountryRegion cr on st.CountryRegionCode = cr.CountryRegionCode
left join sales.store ss on sc.StoreID = ss.BusinessEntityID
left join person.EmailAddress ea on ea.BusinessEntityID = pp.BusinessEntityID
where sc.personID is not null */

/*create view fct_Sales as
Select 
	sh.SalesOrderID,
	cast(sh.OrderDate as Date) OrderDate, 
	cast(sh.ShipDate as Date) ShipDate,
	CASE OnlineOrderFlag when 0 then 'Store' else 'Online' end as IsOnlineOrder,
	sh.CustomerID, 
	CASE WHEN sh.SalesPersonID is null then 9999 else sh.SalesPersonID end as SalesPersonID, 
	sh.TerritoryID, sh.BillToAddressID, sh.ShipToAddressID,
	sd.ProductID, sd.OrderQty, sd.UnitPrice, sd.UnitPriceDiscount, 
	sd.UnitPrice - (sd.UnitPrice * sd.UnitPriceDiscount) UnitPriceAfterDiscount,
	CASE WHEN pc.StandardCost is null then pp.StandardCost else pc.StandardCost end as UnitCost,
	sd.LineTotal,
	(sd.Linetotal/sh.subtotal) * sh.TaxAmt as LineTaxAmt, 
	(sd.Linetotal/sh.subtotal) * sh.Freight as LineFreightAmt
from Sales.SalesOrderHeader SH
left join Sales.SalesOrderDetail SD on SH.SalesOrderID = SD.SalesOrderID
left join production.productcosthistory pc 
on sd.ProductID = pc.ProductID and sh.OrderDate between pc.startdate and pc.EndDate
left join Production.product pp on sd.ProductID = pp.ProductID*/

/* create view dim_Emp as
Select 
	HE.businessentityid EmpID,
	concat(p.firstname,' ',p.middlename,' ',p.lastname) EmpName,
	he.OrganizationLevel,
	he.JobTitle,
	he.BirthDate,
	he.MaritalStatus,
	he.Gender,
	he.HireDate,
	ea.EmailAddress
from HumanResources.Employees HE
left join person.person p on he.businessentityid = p.BusinessEntityID
left join person.EmailAddress ea on p.BusinessEntityID = ea.BusinessEntityID
where p.PersonType = 'SP'

UNION

Select 
	9999			EmpID,
	'Online Sales'	EmpName,
	1				OrganizationLevel,
	'Online'		JobTitle,
	'1974-12-06'	BirthDate,
	''				MaritalStatus,
	''				Gender,
	'2011-05-31'	HireDate,
	'info@databuzzkp.com' EmailAddress
*/