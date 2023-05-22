create or replace view shift_view as
select es.ShiftDate as ShiftDate, es.ShiftStoreID as StoreID, es.ShiftEmployeeID as EmployeeID,
CASE
    WHEN es.ShiftTimePeriod = 1 THEN '12:00pm-8:00am'
    WHEN es.ShiftTimePeriod = 2 THEN '8:00am-4:00pm'
    WHEN es.ShiftTimePeriod = 3 THEN '4:00pm-12:00pm'
END as ShiftTimePeriod
from EmployeeShifts es, Employees e
where e.EmployeeID = es.ShiftEmployeeID;
