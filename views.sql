-- create views to query data from tables
-- including joins to other tables & nested queries
-- Abhinav Uppala

drop view if exists shift_view;
drop view if exists fc_order_view;
drop view if exists gc_order_view;
drop view if exists employee_view;

-- see which employees are working at each store during each shift
create or replace view shift_view as
select es.ShiftDate as ShiftDate,
(select sl.StoreAddress from StoreLocations sl where sl.StoreID = es.ShiftStoreID) as StoreAddress,
CASE
    WHEN es.ShiftTimePeriod = 1 THEN '12:00pm-8:00am'
    WHEN es.ShiftTimePeriod = 2 THEN '8:00am-4:00pm'
    WHEN es.ShiftTimePeriod = 3 THEN '4:00pm-12:00pm'
END as ShiftTimePeriod, e.EmployeeFName || ' ' || e.EmployeeLName as EmployeeName, es.ShiftEmployeeID as EmployeeID, es.ShiftStoreID as StoreID
from EmployeeShifts es, Employees e
where e.EmployeeID = es.ShiftEmployeeID;

-- get all food court orders, along with the customers who ordered them
create or replace view fc_order_view as
select fco.FOrderId as OrderID, fco.FOrderDesc as "desc", fco.FOrderQuantity as Quantity, fco.FOrderDate || ' ' || fco.FOrderTime as OrderTimeStamp,
    fco.FOrderCustomerID as CustomerID, c.CustomerFName || ' ' || c.CustomerLName as CustomerName
from FoodCourtOrders fco, Customers c
where fco.FOrderCustomerID = c.CustomerID;

-- get all grocery orders, along with the customers who ordered them
create or replace view gc_order_view as
select gco.GOrderID as OrderID, gco.GOrderDesc as "desc", gco.GOrderQuantity as Quantity, gco.GOrderDate || ' ' || gco.GOrderTime as OrderTimeStamp,
    gco.GOrderCustomerID as CustomerID, c.CustomerFName || ' ' || c.CustomerLName as CustomerName
from GroceryOrders gco, Customers c
where gco.GOrderCustomerID = c.CustomerID;

-- get employee info, including monthly wage depending on wage type
create or replace view employee_view as
select EmployeeID as ID, EmployeeFName || ' ' || EmployeeLName as Name, EmployeeEmail as Email, EmployeePhoneNo as PhoneNo,
CASE
    WHEN EmployeeWageType = 'Salary' THEN round(EmployeeWage / 12, 2)
    WHEN EmployeeWageType = 'Hourly' THEN round(EmployeeWage * 40, 2)
    ELSE -1
END as MonthlyWage
from Employees;