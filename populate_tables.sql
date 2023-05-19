/*
ID Key:
100X - Employees
200X - Customers
300X - Store Locations
500X - Grocery Items
600X - Grocery Orders
700X - Food Court Orders
800X - FoodCourtItems
*/

-- Adding sample values to the created tables
-- Abhinav Uppala & Raza Hlaing

insert into Customers values
(2001, 'John', 'Doe', 'jdoe21@gmail.com', 1234567890),
(2002, 'Raza', 'Htet', 'razahtet@gmail.com', 9998887777),
(2003, 'Jermaine', 'Cole', 'jcole@gmail.com', 2014000000),
(2004, 'Allen', 'Jarrett', 'ajarrett@eduhsd.k12.ca.us', 9166543678);

insert into Employees values
(1001, 'David', 'Smith', 'dsmith333@gmail.com', 9165743451, '01/28/1985', 'Hourly', 22.25),
(1002, 'Jane', 'Doe', 'joe22@gmail.com', 1234567891, '03/03/1990', 'Salary', 95000.00),
(1003, 'Abhinav', 'Uppala', 'abhinav.uppala@gmail.com', 9168367880, '12/13/2005', 'Hourly', 20.75),
(1004, 'Keith', 'Campbell', 'kcampbell@eduhsd.k12.ca.us', 9163358827, '01/01/1980', 'Salary', 155000.00),
(1005, 'Bruce', 'Wayne', 'batman@batmail.com', 5556839823, '10/30/1995', 'Salary', 9999999.99),
(1006, 'Random', 'Person', 'genericemail@gmail.com', 9161230000, '01/01/2000', 'Hourly', 15.00);

insert into EmployeeShifts values
(1, TO_DATE('5/19/2023', 'MM/DD/YYYY'), 3001, 1001),
(2, TO_DATE('5/19/2023', 'MM/DD/YYYY'), 3001, 1002),
(3, TO_DATE('5/19/2023', 'MM/DD/YYYY'), 3001, 1002),
(1, TO_DATE('5/19/2023', 'MM/DD/YYYY'), 3002, 1003),
(2, TO_DATE('5/19/2023', 'MM/DD/YYYY'), 3002, 1003),
(3, TO_DATE('5/19/2023', 'MM/DD/YYYY'), 3002, 1006),
(1, TO_DATE('5/19/2023', 'MM/DD/YYYY'), 3003, 1004),
(2, TO_DATE('5/19/2023', 'MM/DD/YYYY'), 3003, 1004),
(3, TO_DATE('5/19/2023', 'MM/DD/YYYY'), 3003, 1005);

insert into GroceryInventory values
(5001, 'Banana', NULL, 1.99, 1581, 0.25),
(5002, 'Apple', NULL, 1.49, 2003, 0.10),
(5003, 'Milk', '1 gal milk jug', 5.99, 383, 0),
(5004, 'Watermelon', NULL, 3.99, 149, 0.6),
(5005, 'White Bread', '1 loaf white bread, sliced', 2.79, 1023, 0);

insert into GroceryOrders values
(6001, 5001, '5/19/2023', '13:30:23', 5, '5 bananas for John Doe', 8.06, 2001),
(6002, 5005, '1/12/2022', '05:12:01', 35, NULL, 75.33, 2003),
(6003, 5003, '1/12/2022', '05:13:54', 19, NULL, 122.19, 2003),
(6004, 5004, '5/17/2023', '03:16:03', 2, NULL, 3.45, 2002),
(6005, 5001, '3/23/2023', '19:45:14', 999, 'Late-night snack', 1610.29, 2004);

insert into StoreLocations VALUES
(3001, '256 Lame Rd., Fresno, CA', 1001, 5596453453, '8 a.m. - 8 p.m.', 'Grocery Store'),
(3002, '1029 El Dorado Rd., El Dorado Hills, CA', 1002, 9166453456, '5 a.m. - 12 a.m.', 'Food Court'),
(3003, '139 Darnick Blvd., San Antonio, CA', 1003, 2104823453, '5 a.m. - 12 a.m.', 'Food Court'),
(3004, '444 Barney Lane, Modesto, CA', 1004, 2096990324, '8 a.m. - 8 p.m.', 'Grocery Store');

insert into FoodCourtOrders VALUES
(7001, 'Box of French Fries', '02/05/1986', '10:23:30', 2, 3.40, 2001),
(7002, 'Fortune Cookie', '02/05/1986', '5:24:20',50,1.40, 2002),
(7003, 'Rice with Beef and Broccoli','02/06/1986', '9:21:12', 20, 8.33, 2003),
(7004, 'Extreme Spicy Noodles with Scrambled Egg', '02/06/1986', '7:20:44', 25, 12.32, 2004);

insert into FoodCourtItems VALUES
(8001, 'Box of French Fries', 4.40, '', 1.00, 100),
(8002, 'Fortune Cookie', 1.40, '', 0, 50),
(8003, 'Rice with Beef and Broccoli', 10.33, 'Rice with side of Broccoli and cut beef', 2.00, 20),
(8004, 'Extreme Spicy Noodles with Scrambled Egg', 12.32, 'Spicy Thai Noodles with Scrambled Egg', 0, 14);