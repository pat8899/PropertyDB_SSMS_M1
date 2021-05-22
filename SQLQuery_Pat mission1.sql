--1. Write queries to return the following: 

--(a) Display a list of all property names and their property id’s for Owner Id: 1426. 
select OwnerId, Name as PropertyName, PropertyId 
from dbo.Property 
join dbo.OwnerProperty on dbo.Property.Id = dbo.OwnerProperty.PropertyId
where OwnerId = 1426

--(b) Display the current home value for each property in question a). 

select Name as PropertyName, Value from dbo.PropertyHomeValue
join dbo.Property on dbo.PropertyHomeValue.PropertyId = dbo.Property.Id 
join dbo.OwnerProperty on dbo.Property.Id = dbo.OwnerProperty.PropertyId
where OwnerId = 1426

--(c) For each property in question a), return the following:                                                                      
--(c-1) Using rental payment amount, rental payment frequency, tenant start date and tenant end date to write a query that returns the sum of all payments from start date to end date. 

select Property.Name  as PropertyName, Amount, Code as Frequency, StartDate, EndDate
from Property
join OwnerProperty on Property.Id = OwnerProperty.PropertyId
join PropertyRentalPayment on Property.Id = PropertyRentalPayment.PropertyId
join TenantProperty on PropertyRentalPayment.PropertyId = TenantProperty.PropertyId
join TenantPaymentFrequencies on TenantProperty.PaymentFrequencyId = TenantPaymentFrequencies.Id
where OwnerId = 1426

--(c-2) Display the yield. 
select Name as PropertyName, Yield from PropertyFinance
join Property on PropertyFinance.PropertyId = Property.Id 
join OwnerProperty on Property.Id = OwnerProperty.PropertyId
where OwnerId = 1426

--(d) Display all the jobs available
select * from dbo.job

--(e) Display all property names, current tenants first and last names and rental payments per week/ fortnight/month for the properties in question a). 
select Name as PropertyName, FirstName, LastName, Amount as PaymentsPerWeek 
from Property 
join OwnerProperty on Property.Id = OwnerProperty.PropertyId
join PropertyRentalPayment on Property.Id = PropertyRentalPayment.PropertyId
join TenantProperty on OwnerProperty.PropertyId = TenantProperty.PropertyId
join Person on TenantProperty.TenantId = Person.Id
where OwnerId = 1426

