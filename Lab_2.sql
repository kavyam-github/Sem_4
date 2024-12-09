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