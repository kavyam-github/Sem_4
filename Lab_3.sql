---Lab 3

---Part A

CREATE TABLE Departments (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE,
 ManagerID INT NOT NULL,
 Location VARCHAR(100) NOT NULL
);

select * from Departments

CREATE TABLE Employee (
 EmployeeID INT PRIMARY KEY,
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 DoB DATETIME NOT NULL,
 Gender VARCHAR(50) NOT NULL,
 HireDate DATETIME NOT NULL,
 DepartmentID INT NOT NULL,
 Salary DECIMAL(10, 2) NOT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

select * from Employee

-- Create Projects Table
CREATE TABLE Projects (
 ProjectID INT PRIMARY KEY,
 ProjectName VARCHAR(100) NOT NULL,
 StartDate DATETIME NOT NULL,
 EndDate DATETIME NOT NULL,
 DepartmentID INT NOT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

select * from Projects

INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID, Location)
VALUES
 (1, 'IT', 101, 'New York'),
 (2, 'HR', 102, 'San Francisco'),
 (3, 'Finance', 103, 'Los Angeles'),
 (4, 'Admin', 104, 'Chicago'),
 (5, 'Marketing', 105, 'Miami');


INSERT INTO Employee (EmployeeID, FirstName, LastName, DoB, Gender, HireDate, DepartmentID,
Salary)
VALUES
 (101, 'John', 'Doe', '1985-04-12', 'Male', '2010-06-15', 1, 75000.00),
 (102, 'Jane', 'Smith', '1990-08-24', 'Female', '2015-03-10', 2, 60000.00),
 (103, 'Robert', 'Brown', '1982-12-05', 'Male', '2008-09-25', 3, 82000.00),
 (104, 'Emily', 'Davis', '1988-11-11', 'Female', '2012-07-18', 4, 58000.00),
 (105, 'Michael', 'Wilson', '1992-02-02', 'Male', '2018-11-30', 5, 67000.00);

 INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID)
VALUES
 (201, 'Project Alpha', '2022-01-01', '2022-12-31', 1),
 (202, 'Project Beta', '2023-03-15', '2024-03-14', 2),
 (203, 'Project Gamma', '2021-06-01', '2022-05-31', 3),
 (204, 'Project Delta', '2020-10-10', '2021-10-09', 4),
 (205, 'Project Epsilon', '2024-04-01', '2025-03-31', 5);


---1
create or alter procedure PR_Employee_Insert
	@FirstName varchar(100)=null,
	@LastName varchar(100)=null
as begin
select EmployeeId,DOB,Gender,Hiredate from Employee where FirstName=@FirstName or LastName=@LastName;
end

exec PR_Employee_Insert @FirstName='John'


--2
create or alter procedure PR_Department_Insert
	@DepartmentName varchar(100)
as begin 
select E.EmployeeID,E.FirstName,E.LastName,D.DepartmentName from Employee E join
Department D on E.DepartmentID=D.DepartmentID where D.DepartmentName=@DepartmentName
end

--3
create or alter Procedure PR_Projects_insert
	@ProjectName varchar(100),
	@DepartmentName varchar(100)
as begin
select p.ProjectID,p.ProjectName,p.StartDate,p.EndDate,p.DepartmentID,d.DepartmentName from 
Projects p join Departments d on p.DepartmentID=d.DepartmentID where
p.ProjectName=@ProjectName and d.DepartmentName=@DepartmentName
end
exec PR_Projects_insert @ProjectName='Project Gamma',@DepartmentName='Finance'


--4
create or alter Procedure PR_Employee_Salary
	@MinSalary int,
	@MaxSalary int
as begin
select EmployeeID,FirstName,LastName,Salary from Employee where Salary between @MinSalary and @MaxSalary
end
exec PR_Employee_Salary 50000,100000

--5
create or alter Procedure PR_Employee_JoiningDate
	@HireDate datetime
as begin
select FirstName,LastName,HireDate from Employee where HireDate=@HireDate
end			

----Part B


--6
create or alter Procedure PR_Employee_Gender
	@Gender varchar(100)
as begin 
select Gender,FirstName,LastName from Employee where Gender like @Gender+'%'
end
exec PR_Employee_Gender 'M'

--7
create or alter proc PR_Departments_EmployeeData
	@FirstName varchar(100) = null,
	@DepartmentName varchar(100) = null
as
begin
	select * from Employee join Departments
	on Employee.DepartmentID = Departments.DepartmentID
	where Employee.FirstName = @FirstName or Departments.DepartmentName = @DepartmentName
end

exec PR_Departments_EmployeeData @DepartmentName = 'IT'

--8create or alter proc PR_Department_Location
create or alter proc PR_Department_Location
	@Location varchar(100)
as
begin
	select * from Departments
	where Location like '%'+@Location+'%';
end

exec PR_Department_Location 'new'

---Part C

--9
create or alter procedure PR_Project_Date
	@StartDate datetime,
	@EndDate datetime
as begin
 select e.FirstName,e.LastName,p.ProjectID,p.ProjectName,p.StartDate,p.EndDate,p.DepartmentID 
 from Employee e join Projects p on e.DepartmentID=p.DepartmentID 
 where p.StartDate=@StartDate and p.EndDate=@EndDate 
End

exec PR_Project_Date '2022-01-01','2022-12-31'


--10
create or alter proc PR_Projects_AllDetails
	@ProjectName varchar(100),
	@Location varchar(100)
as
begin
	SELECT 
        p.ProjectName,
        p.StartDate,
        p.EndDate,
        d.DepartmentName,
        CONCAT(e.FirstName, ' ', e.LastName) AS ManagerName,
        d.Location
    FROM 
        Projects p
    INNER JOIN 
        Departments d ON p.DepartmentID = d.DepartmentID
    INNER JOIN 
        Employee e ON d.ManagerID = e.EmployeeID
    WHERE 
        p.ProjectName = @ProjectName AND
        d.Location = @Location; 
end

exec PR_Projects_AllDetails 'Project Beta', 'San Francisco'