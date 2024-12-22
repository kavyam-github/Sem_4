--Lab_2


-- Create Department Table
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

select * from Department
drop table Department

-- Create Designation Table
CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);

select * from Designation
Drop table Designation

-- Create Person Table
CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);

select * from Person
drop table Person

--1


--insert
create or alter procedure PR_Department_Insert
		@DepartmentID int,
		@DepartmentName varchar(100)
As
Begin
	insert into Department
	(
	DepartmentID,
	DepartmentName
	)
	values
	(
	@DepartmentID,
	@DepartmentName
	)
	end

create or alter procedure PR_Designation_Insert
		@DesignationID int,
		@DesignationName varchar(100)
As
Begin
	insert into Designation
	(
	DesignationID,
	DesignationName
	)
	values
	(
	@DesignationID,
	@DesignationName
	)
	end


create or alter procedure PR_Person_Insert
		
		@FristName varchar(100),
		@LastName varchar(100),
		@Salary Decimal(8,2),
		@JoiningDate Datetime,
		@DepartmentID int,
		@DesignationID int

As
Begin
	insert into Person
	(
	FirstName,
	LastName,
	Salary,
	JoiningDate,
	DepartmentID,
	DesignationID
	)
	values
	(
		@FristName,
		@LastName,
		@Salary,
		@JoiningDate,
		@DepartmentID,
		@DesignationID
	)
	end


--exec query 
--department

exec PR_Department_Insert 1,'Admin'
exec PR_Department_Insert 2,'IT'
exec PR_Department_Insert 3,'HR'
exec PR_Department_Insert 4,'Account'


--designation

exec PR_Designation_Insert 11,'Jobber'
exec PR_Designation_Insert 12,'Welder'
exec PR_Designation_Insert 13,'Clerk'
exec PR_Designation_Insert 14,'Manager'
exec PR_Designation_Insert 15,'CEO'

--person
exec PR_Person_Insert 'Rahul','Anshu',56000,'1990-01-01',1,12
exec PR_Person_Insert 'Hardik','Hinsu',18000,'1990-09-25',2,11
exec PR_Person_Insert 'Bhavin','Kamani',25000,'1991-05-14',NULL,11
exec PR_Person_Insert 'Bhoomi','Patel',39000,'2014-02-20',1,13
exec PR_Person_Insert 'Rohit','Rajgor',17000,'1990-07-23',2,15
exec PR_Person_Insert 'Priya','Mehta',25000,'1990-10-18',2,NULL
exec PR_Person_Insert 'Neha','Trivedi',18000,'2014-02-20',3,15


--update
create or alter procedure PR_Department_update
		@DepartmentID int,
		@DepartmentName varchar(100)
as begin
	Update Department
	set DepartmentName=@DepartmentName
	where  @DepartmentID=@DepartmentID
End



create or alter procedure PR_Designation_update
		@DesignationId int,
		@DesignationName varchar(100)
as begin 
	update Designation
	set DesignationId=@DesignationId
	where DesignationName=@DesignationName
End


create or alter procedure PR_Person_Update
		@PersonId int,
		@FirstName varchar(100),
		@LastName varchar(100),
		@Salary decimal(8,2),
		@JoiningDate datetime,
		@DepartmentId int,
		@DesignationId int
as begin
	update Person
	set FirstName=@FirstName,
		LastName=@LastName,
		Salary=@Salary,
		JoiningDate=@JoiningDate,
		DepartmentId=@DepartmentId,
		DesignationId=@DesignationId,
	where PersonId=@PersonId
End


--delete

create or alter procedure PR_Department_delete
	@DepartmentID int,
	@DepartmentName varchar(100)
	as begin
	delete from department
	where DepartmentID=@DepartmentID,
End


create or alter procedure PR_Designation_delete
	@DesignationID int,
	@DesignationName varchar(100)
	as begin
	delete from Designation
	where DesignationID=@DDesignationID,
End



create or alter procedure PR_Person_delete
		@PersonId int,
		@FirstName varchar(100),
		@LastName varchar(100),
		@Salary decimal(8,2),
		@JoiningDate datetime,
		@DepartmentId int,
		@DesignationId int
as begin
	delete from Person
	 where PersonId=@PersonId;
End


---2
create or alter Procedure PR_Department_SELECTBYPRIMARYKEY
	@DepartmentID int
as begin
 select * from Department where DepartmentID=@DepartmentID;
End


create or alter Procedure PR_Designation_SELECTBYPRIMARYKEY
	@DesignationID int
as begin
 select * from Designation where DesignationID=@DesignationID
End


create or alter Procedure PR_Person_SELECTBYPRIMARYKEY
	@PersonID int
as begin
 select * from Person where PersonID=@PersonID
End


---3
create or alter Procedure PR_Department_Display
as begin
	 select * from Department;
End


create or alter Procedure PR_Designation_Display
as begin
		select * from Designation;
End


create or alter Procedure PR_Person_Display
as begin
	select * from Person join Department on Person.DepartmentId=Department.DepartmentId join Designation
	on Person.DesignationId=Designation.DesignationId
End


---4
create or alter Procedure PR_Person_Top3
as begin
	select Top 3 * from Person 
End


--Part B

---5
CREATE OR ALTER PROCEDURE PR_DEPARTMENTWISEWORKERS
		@DEPARTMENTNAME VARCHAR(100)
AS 
BEGIN
	SELECT DEPARTMENT.DEPARTMENTNAME,PERSON.FIRSTNAME 
	FROM DEPARTMENT JOIN PERSON ON DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID
	WHERE DEPARTMENTNAME=@DEPARTMENTNAME;
END

EXEC PR_DEPARTMENTWISEWORKERS 'ADMIN'

--6
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_WORKERDETAIL
		@DEPARTMENTNAME VARCHAR(100),
		@DESIGNATIONNAME VARCHAR(100)
AS 
BEGIN
	SELECT DEPARTMENT.DEPARTMENTNAME,PERSON.FIRSTNAME,PERSON.SALARY,PERSON.JOININGDATE 
	FROM DEPARTMENT JOIN PERSON ON DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID
	JOIN DESIGNATION ON DESIGNATION.DESIGNATIONID=PERSON.DESIGNATIONID
	WHERE DEPARTMENTNAME=@DEPARTMENTNAME AND DESIGNATIONNAME=@DESIGNATIONNAME;
END

EXEC PR_DEPARTMENT_WORKERDETAIL 'ADMIN','CLERK'

--7
CREATE OR ALTER PROCEDURE PR_PERSON_WORKERDETAIL
		@FIRSTNAME VARCHAR(100)
AS 
BEGIN
	SELECT PERSON.FIRSTNAME,PERSON.LASTNAME,PERSON.SALARY,PERSON.JOININGDATE,DEPARTMENT.DEPARTMENTNAME,DESIGNATION.DESIGNATIONNAME
	FROM DEPARTMENT JOIN PERSON ON DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID
	JOIN DESIGNATION ON DESIGNATION.DESIGNATIONID=PERSON.DESIGNATIONID
	WHERE FIRSTNAME=@FIRSTNAME;
END

EXEC PR_PERSON_WORKERDETAIL 'ROHIT';

--8
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_DEPARTMENTWISESALARY
		@DEPARTMENTNAME VARCHAR(100)
AS 
BEGIN
	SELECT DEPARTMENT.DEPARTMENTNAME,MAX(PERSON.SALARY) AS MAX_SALARY,MIN(PERSON.SALARY) AS MIN_SALARY,SUM(PERSON.SALARY) AS TOTAL_SALARY
	FROM DEPARTMENT JOIN PERSON 
	ON DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID
	WHERE DEPARTMENTNAME=@DEPARTMENTNAME
	GROUP BY DEPARTMENTNAME;
END

EXEC PR_DEPARTMENT_DEPARTMENTWISESALARY 'HR'

--9
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_DESIGNATIONWISESALARY
		@DESIGNATIONNAME VARCHAR(100)
AS 
BEGIN
	SELECT DESIGNATION.DESIGNATIONNAME,AVG(PERSON.SALARY) AS AVERAGE_SALARY,SUM(PERSON.SALARY) AS TOTAL_SALARY
	FROM DESIGNATION JOIN PERSON 
	ON DESIGNATION.DESIGNATIONID=PERSON.DESIGNATIONID
	WHERE DESIGNATIONNAME=@DESIGNATIONNAME
	GROUP BY DESIGNATIONNAME;
END

EXEC PR_DEPARTMENT_DESIGNATIONWISESALARY 'JOBBER'

----Part C
---10
create or alter proc PR_Department_PersonCount
	@DepartmentName varchar(100)
as
begin
	select Department.DepartmentName, count(Person.PersonID)
	from Department join Person
	on Department.DepartmentID = Person.DepartmentID
	Where Department.DepartmentName = @DepartmentName
	GROUP BY DepartmentName
end

exec PR_Department_PersonCount 'Admin'

--11
create or alter proc PR_Department_Salary
	@Salary int
as
begin
	select Person.FirstName, Department.DepartmentName, Designation.DesignationName
	from Person join Department
	on Person.DepartmentID = Department.DepartmentID join Designation
	on Person.DesignationID = Designation.DesignationID
	where Person.Salary > @Salary
end

exec PR_Department_Salary 18000

--12
create or alter proc PR_Department_HighestSalary
as
begin
	select Department.DepartmentID, Department.DepartmentName,sum(Salary) as Total_Salary from Department
	join Person
	on Person.DepartmentID = Department.DepartmentID
	group by Department.DepartmentID,Department.DepartmentName
	having sum(salary) in (select max(Total_Salary) as Max_Salary from (select sum(Salary) as Total_Salary from Person group by DepartmentID) as Salary)
end

--13
create or alter proc PR_Designation_WorkerDetails
	@DesinationName Varchar(100)
as
begin
	select Person.FirstName, Person.JoiningDate, Department.DepartmentName, Designation.DesignationName
	from Person join Department
	on Person.DepartmentID = Department.DepartmentID join Designation
	on Person.DesignationID = Designation.DesignationID
	where Designation.DesignationName = @DesinationName and
	Person.JoiningDate > (SELECT dateadd(year, -10, getdate()))
end

--14
create or alter proc PR_Department_NoDesignation
as
begin
	select Person.FirstName, Department.DepartmentName
	from Person join Department
	on Person.DepartmentID = Department.DepartmentID
	where Person.DesignationID is null
end

--15
create or alter proc PR_Department_AvgSalary
as
begin
	select FirstName, Salary, DepartmentName
	from Person join Department
	on Person.DepartmentID = Department.DepartmentID
	group by Department.DepartmentName,FirstName,salary
	having avg(Person.Salary) > 12000;
end