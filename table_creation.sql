-- reset all tables
-- cascade used to drop dependent objects (FKs)
drop table if exists Customers cascade;
drop table if exists EmployeeShifts cascade;
drop table if exists GroceryInventory cascade;
drop table if exists FoodCourts cascade;
drop table if exists GroceryStores cascade;
drop table if exists FoodCourtOrders cascade;
drop table if exists GroceryOrders cascade;
drop table if exists Employees cascade;

-- store customer information
create table Customers
(
    CustomerID int PRIMARY KEY,
    CustomerFName text NOT NULL,
    CustomerLName text NOT NULL,
    CustomerEmail text NOT NULL,
    CustomerPhoneNo int NOT NULL
);

-- store employee information
create table Employees
(
    EmployeeID int PRIMARY KEY,
    EmployeeFName text NOT NULL,
    EmployeeLName text NOT NULL,
    EmployeeEmail text NOT NULL,
    EmployeePhoneNo int NOT NULL,
    EmployeeDOB date NOT NULL,
    EmployeeWageType text NOT NULL, -- either "Salary" or "Hourly"
    EmployeeWage decimal(12, 2) NOT NULL
);

-- manages which employee is working what time at what location
create table EmployeeShifts
(
    ShiftTimePeriod int NOT NULL, -- date & time period of shift
    ShiftDate date NOT NULL,
    ShiftGroceryStoreID int NOT NULL, -- at least 1 of these 2 must be not-null
    ShiftFoodCourtID int NOT NULL,
    ShiftEmployeeID int NOT NULL,
    FOREIGN KEY (ShiftEmployeeID) REFERENCES Employees(EmployeeID),
    -- figure out how to add multiple FKs or just leave it as is
);

-- store grocery product information
create table GroceryInventory
(
    GroceryItemID int PRIMARY KEY,
    GroceryItemName text UNIQUE NOT NULL,
    GroceryItemDesc text,
    GroceryItemPrice decimal(8,2) NOT NULL,
    GroceryItemQuantity int NOT NULL,
    GroceryItemDiscount decimal(3,2) -- (1, 0] representing % discount
);

-- store food court product information
CREATE TABLE FoodCourts (
    FoodCourtItemID int PRIMARY KEY,
    FoodCourtItemName text UNIQUE NOT NULL,
    FoodCourtItemPrice decimal(8,2) NOT NULL,
    FoodCourtItemDesc text,
    FoodCourtItemDiscount decimal(3,2),
    FoodCourtItemQuantity int NOT NULL
);

-- manage information about grocery store locations
CREATE TABLE GroceryStores (
    GroceryStoreID int PRIMARY KEY,
    GroceryStoreAddress text NOT NULL,
    GroceryStoreManagerID int NOT NULL,
    GroceryStorePhone int NOT NULL,
    GroceryStoreHours text NOT NULL,
    FOREIGN KEY (GroceryStoreManagerID) REFERENCES employees(EmployeeID)
);

-- manage grocery store orders
CREATE TABLE GroceryOrders (
    GOrderID int PRIMARY KEY,
    GOrderItemID int NOT NULL,
    GOrderDate date NOT NULL,
    GOrderTime time NOT NULL,
    GOrderQuantity int NOT NULL,
    GOrderDesc text,
    GOrderPrice decimal(8,2) NOT NULL,
    GOrderCustomerID int NOT NULL,
    FOREIGN KEY (GOrderCustomerID) REFERENCES customers(CustomerID)
);

-- manage food court orders
CREATE TABLE FoodCourtOrders (
    FOrderID int PRIMARY KEY,
    FOrderItemID int NOT NULL,
    FOrderDesc text,
    FOrderDate DATE NOT NULL,
    FOrderTime TIME NOT NULL,
    FOrderQuantity int NOT NULL,
    FOrderPrice decimal(8,2) NOT NULL,
    FOrderCustomerID int NOT NULL,
    FOREIGN KEY (FOrderCustomerID) REFERENCES customers(CustomerID)
);