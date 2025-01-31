-------CREATING TABLES--------

CREATE TABLE Employees
(EmployeeID varchar(50),
FirstName varchar(50),
LastName varchar(50),
DepartmentID int,
HireDate DATE DEFAULT '01-01-2020',
Salary int)

CREATE TABLE Department
(DepartmentID int,
DepartmentName varchar (50),
ManagerID int)
  
---------INSERTING DATA----------
  
INSERT INTO BasicSQLPROJECT.dbo.Employees VALUES
(101, 'John', 'Wesley', 1, '2020-01-01', 49000),
(102, 'Samantha', 'Brick', 2,'2020-01-25', 37000),
(103, 'Juan', 'Mexico', 3,'2020-03-13', 45000),
(104, 'Lucky', 'Darkness', 2,'2020-04-24', 41000),
(105, 'Rock', 'Knight', 3,'2020-04-29', 39000),
(106, 'Miley', 'Rugg', 1,'2020-05-13', 42000)

INSERT INTO BasicSQLProject.dbo.Department VALUES
(1, 'HR', 101),
(2, 'IT', 102),
(3, 'Finance', 103)
  
----------------------------------------------------------
---------------------Practice Queries---------------------
--0. Join the two tables together.--

SELECT * 
FROM BasicSQLProject.dbo.Employees
JOIN BasicSQLProject.dbo.Department
ON Employees.DepartmentID = Department.DepartmentID

--1. Retrieve all employees who work in the IT department.--

SELECT FirstName, LastName, Salary
From BasicSQLProject.dbo.Employees
Inner Join BasicSQLProject.dbo.Department
ON Employees.DepartmentID = Department.DepartmentID
WHERE DepartmentName = 'IT'

--2.Find employees hired after 2020-03-13.--

SELECT * FROM BasicSQLProject.dbo.Employees
WHERE HireDate > '2020-03-13'

--3.List all employees and their department name.--

SELECT Employees.FirstName, LastName, Department.DepartmentName
FROM BasicSQLProject.dbo.Employees
INNER JOIN BasicSQLProject.dbo.Department
ON Employees.DepartmentID = Department.DepartmentID

--4. Calculate the Average salary per department.--

SELECT BasicSQLProject.dbo.Department.DepartmentName, AVG(BasicSQLProject.dbo.Employees.Salary) AS AVGSalary
FROM BasicSQLProject.dbo.Employees 
INNER JOIN BasicSQLProject.dbo.Department ON Employees.DepartmentID = Department.DepartmentID
GROUP BY Department.DepartmentName

--5. Count the number of employees in each department.--

SELECT BasicSQLProject.dbo.Department.DepartmentName, COUNT(BasicSQLProject.dbo.Employees.DepartmentID) AS EmployeeCount
FROM BasicSQLProject.dbo.Employees
INNER JOIN BasicSQLProject.dbo.Department ON Employees.DepartmentID = Department.DepartmentID
GROUP BY Department.DepartmentName

--6. Display all employees, ordered by their hire date.--

SELECT EmployeeID,FirstName,LastName,HireDate 
FROM BasicSQLProject.dbo.Employees
ORDER BY HireDate ASC

--7. List employees with the highest salaries first.

SELECT EmployeeID, FirstName, LastName, Salary
FROM BasicSQLProject.dbo.Employees
ORDER BY Salary DESC

--8. Combine employees who were hired after 2020-04-24 with those earning 45000 or over 45000.--

SELECT FirstName, LastName, HireDate
FROM BasicSQLProject.dbo.Employees
WHERE HireDate > '2020-04-24'
UNION
SELECT FirstName, LastName, HireDate
FROM BasicSQLProject.dbo.Employees
WHERE Salary >= 45000

--8. Update the Salary on the Employee 101.--

SELECT EmployeeID, Salary
FROM BasicSQLProject.dbo.Employees
UPDATE BasicSQLProject.dbo.Employees
SET Salary = 48500
WHERE EmployeeID = 101

--9. Generate a list of all employees with their department ID and include details of their allocated Christmas bouses.--

SELECT Employees.FirstName, LastName, Salary, Department.DepartmentID, DepartmentName,
CASE
WHEN Department.DepartmentName = 'HR' THEN Salary + ( Salary * .05)
WHEN Department.DepartmentName = 'IT' THEN Salary + (Salary * .10)
WHEN Department.DepartmentName = 'Finance' THEN Salary + ( Salary * .15)
ELSE Salary
END AS SalaryAfterBonus
FROM BasicSQLProject.dbo.Employees
JOIN BasicSQLProject.dbo.Department
ON Employees.DepartmentID = Department.DepartmentID
ORDER BY Salary DESC


