-------CREATING TABLES AND INSERTING DATA--------

--CREATE TABLE Employees
--(EmployeeID varchar(50),
--FirstName varchar(50),
--LastName varchar(50),
--DepartmentID int,
--HireDate DATE DEFAULT '01-01-2020',
--Salary int)

--CREATE TABLE Department
--(DepartmentID int,
--DepartmentName varchar (50),
--ManagerID int)

--INSERT INTO BasicSQLPROJECT.dbo.Employees VALUES
--(101, 'John', 'Wesley', 1, '2020-01-01', 49000),
--(102, 'Samantha', 'Brick', 2,'2020-01-25', 37000),
--(103, 'Juan', 'Mexico', 3,'2020-03-13', 45000),
--(104, 'Lucky', 'Darkness', 2,'2020-04-24', 41000),
--(105, 'Rock', 'Knight', 3,'2020-04-29', 39000),
--(106, 'Miley', 'Rugg', 1,'2020-05-13', 42000)

--INSERT INTO BasicSQLProject.dbo.Department VALUES
--(1, 'HR', 101),
--(2, 'IT', 102),
--(3, 'Finance', 103)
----------------------------------------------------------
---------------------Practice Queries---------------------

--1. Retrieve all employees who work in the IT department.--
--SELECT FirstName, LastName, Salary
--From BasicSQLProject.dbo.Employees
--Inner Join BasicSQLProject.dbo.Department
--ON Employees.DepartmentID = Department.DepartmentID
--WHERE DepartmentName = 'IT'

--2.Find employees hired after 2020-03-13.--
--SELECT * FROM BasicSQLProject.dbo.Employees
--WHERE HireDate > '2020-03-13'

--3.List all employees and their department name.--
--SELECT Employees.FirstName, LastName, Department.DepartmentName
--FROM BasicSQLProject.dbo.Employees
--INNER JOIN BasicSQLProject.dbo.Department
--ON Employees.DepartmentID = Department.DepartmentID

