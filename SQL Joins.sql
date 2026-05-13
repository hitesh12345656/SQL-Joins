-- Assignment Name: SQL JOINS
-- Name : Hitesh Dhoke

CREATE DATABASE Restaurent;
USE Restaurent;
CREATE TABLE Customers (
Customer_ID INT PRIMARY KEY,
Customer_Name varchar(50),
City varchar(50));

INSERT INTO customers
(Customer_ID,Customer_Name,City)
value
(1,'John Smith','New York'),
(2,'Marry Johnson','Chicago'),
(3,'Peter Adams','Los Angles'),
(4,'Nancy Miller','Houston'),
(5,'Robert White','Miami');

SELECT * FROM customers;

CREATE TABLE Orders (
Order_ID INT PRIMARY KEY ,
Customer_ID Varchar(50),
Order_Date date,
Amount Decimal(20,5));

INSERT INTO Orders
(Order_ID,Customer_ID,Order_date,Amount)
Values
( 101,1,'2024-10-01',250),
(102,2,'2024-10-05',300),
(103,1,'2024-10-07', 150),
(104,3,'2024-10-10', 450),
(105,6,'2024-10-12',400);

SELECT * FROM Orders;

CREATE TABLE Payments (
Payment_ID Varchar(10) PRIMARY KEY,
Customer_ID Varchar(50),
Payment_date Date,
Amount Decimal (20,4));


INSERT INTO Payments 
( Payment_ID,Customer_ID,Payment_date,Amount)
Values
('P001', 1, '2024-10-02', 250),
('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),
('P004', 4, '2024-10-15', 200);

SELECT * FROM Payments;

CREATE TABLE Employees (
Employee_ID INT PRIMARY KEY,
Employee_Name Varchar(50),
Manager_ID INT);

INSERT INTO Employees
(Employee_ID, Employee_Name,Manager_ID)
 VALUES
(1, 'Alex Green', NULL),
(2, 'Brian Lee', 1),
(3, 'Carol Ray', 1),
(4, 'Eva Smith', 2),
(5, 'David Kim', 2);

SELECT * FROM Employees;


-- Question 1. Retrieve all customers who have placed at least one order.
ANS: 

SELECT Distinct c.Customer_Name,c.Customer_ID,O.Order_ID
FROM customers c
INNER JOIN Orders O
ON c.Customer_ID = O.Order_ID;

_______________________________________________________________________________________________________________________________________________________
-- Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.
ANS: 

SELECT c.Customer_Name,c.Customer_ID,O.Order_ID
FROM customers c
LEFT JOIN Orders O
ON c.Customer_ID = O.Customer_ID
WHERE O.Customer_ID IS NULL; 

_______________________________________________________________________________________________________________________________________________________

-- Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown
customers.
ANS:

SELECT c.Customer_Name,c.Customer_ID,O.Order_ID
FROM customers c
LEFT JOIN Orders o
ON c.Customer_ID = O.Order_ID
WHERE c.Customer_ID IS NULL; 
_______________________________________________________________________________________________________________________________________________________

-- Question 4. Display all customers and orders, whether matched or not.
ANS:

SELECT c.Customer_Name,c.Customer_ID,O.Order_ID
FROM customers c
CROSS JOIN Orders O
ON c.Customer_ID = O.Order_ID;
_______________________________________________________________________________________________________________________________________________________

-- Question 5. Find customers who have not placed any orders.
ANS:

SELECT c.Customer_ID,c.Customer_Name,O.Order_ID
FROM customers c
LEFT JOIN  Orders O
ON c.Customer_ID = O.Customer_ID
WHERE O.Order_ID IS NULL;
_______________________________________________________________________________________________________________________________________________________

-- Question 6. Retrieve customers who made payments but did not place any orders.
ANS:

SELECT c.CustomerName,c.CustomerID,O.OrderID,p.CustomerID
FROM customers  
LEFT JOIN Orders O
ON c.CustomerID = O.CustomerID
WHERE O.OrderID IS NULL
AND p.CustomerID IS NOT NULL;
_______________________________________________________________________________________________________________________________________________________

-- Question 7. Generate a list of all possible combinations between Customers and Orders.
ANS: 

SELECT c.Customer_ID,c.Customer_Name,O.Order_ID
FROM customers c
CROSS JOIN Orders O;
_______________________________________________________________________________________________________________________________________________________

-- Question 8. Show all customers along with order and payment amounts in one table.
ANS:

SELECT c.Customer_ID,O.Amount AS OrderAmount,p.Amount AS PaymentAmount
FROM customers c
LEFT JOIN Orders O ON c.Customer_ID = O.CustomerID
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID;

______________________________________________________________________________________________________________________________________________________

-- Question 9. Retrieve all customers who have both placed orders and made payments.
ANS: 

SELECT Customers.Customer_ID,Customers.Customer_Name,Orders.Order_ID,Payments.CustomerID
FROM Customers
LEFT JOIN
Orders
ON Customers.Customer_ID = Orders.Customer_ID
WHERE Orders.Order_ID IS NOT NULL
AND Payments.CustomerID IS NOT NULL;
DESCRIBE Orders;






























































