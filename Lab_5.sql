-----------------------------Lab_5-----------------
-----Part_A-------------

-- Creating PersonInfo Table

CREATE TABLE PersonInfo (
 PersonID INT PRIMARY KEY,
 PersonName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8,2) NOT NULL,
 JoiningDate DATETIME NULL,
 City VARCHAR(100) NOT NULL,
 Age INT NULL,
 BirthDate DATETIME NOT NULL
);

select * from PersonInfo

-- Creating PersonLog Table

CREATE TABLE PersonLog (
 PLogID INT PRIMARY KEY IDENTITY(1,1),
 PersonID INT NOT NULL,
 PersonName VARCHAR(250) NOT NULL,
 Operation VARCHAR(50) NOT NULL,
 UpdateDate DATETIME NOT NULL,
 FOREIGN KEY (PersonID) REFERENCES PersonInfo(PersonID) ON DELETE CASCADE
);

select * from PersonLog
---1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display a message “Record is Affected.”

Create Trigger tr_DisplayMesssage
on PersonInfo
After Insert,Update,Delete
as begin
	Print 'Record is Affected'
End


--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that,log all operations performed on the person table into PersonLog
--Insert
Create Trigger tr_LogOpt_Insert
on PersonInfo
After Insert
as begin
	Declare @PersonID int,@PersonName varchar(100)
	Select @PersonID=PersonID from inserted
	Select PersonName=@PersonName from inserted
	
	Insert into PersonLog (PersonID,PersonName,Operation,UpdateDate) values(@PersonID,@PersonName,'Inserted',GETDATE())
End

--Update
Create Trigger tr_LogOpt_Update
on PersonInfo
After Update
as begin
	Declare @PersonID int,@PersonName varchar(100)
	Select @PersonID=PersonID from inserted
	Select @PersonNamen=PersonName from inserted
	
	Insert into PersonLog (PersonID,PersonName,Operation,UpdateDate) values(@PersonID,@PersonName,'Updated',GETDATE())
End

--Delete
Create Trigger tr_LogOpt_Delete
on PersonInfo
After Delete
as begin
	Declare @PersonID int,@PersonName varchar(100)
	Select @PersonID=PersonID from deleted
	Select @PersonName=PersonName from deleted
	
	Insert into PersonLog (PersonID,PersonName,Operation,UpdateDate) values(@PersonID,@PersonName,'Delete',GETDATE())
End

--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, log all operations performed on the person table into PersonLog.
--Insert
Create Trigger TR_Log_Opt_Insert
on PersonInfo
Instead of Insert
as begin
	Declare @PersonID int,@PersonName varchar(100)
	Select @PersonID=@PersonID from inserted
	Select PersonName=@PersonName from inserted

	Insert into PersonLog (PersonID,PersonName,Operation,UpdateDate) values(@PersonID,@PersonName,'Inserted',GETDATE())
End

--Updated
Create Trigger TR_Log_Opt_Update
on PersonInfo
Instead of Update
as begin
	Declare @PersonID int,@PersonName varchar(100)
	Select @PersonID=@PersonID from inserted
	Select PersonName=@PersonName from inserted

	Insert into PersonLog (PersonID,PersonName,Operation,UpdateDate) values(@PersonID,@PersonName,'Update',GETDATE())
End

--Deleted
Create Trigger TR_Log_Opt_Delete
on PersonInfo
Instead of Delete
as begin
	Declare @PersonID int,@PersonName varchar(100)
	Select @PersonID=@PersonID from deleted
	Select PersonName=@PersonName from deleted

	Insert into PersonLog (PersonID,PersonName,Operation,UpdateDate) values(@PersonID,@PersonName,'Delete',GETDATE())
End

--4.Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into uppercase whenever the record is inserted.
CREATE TRIGGER tr_UppercaseName
ON PersonInfo
AFTER INSERT
AS
BEGIN
    UPDATE PersonInfo
    SET PersonName = UPPER(PersonName)
    WHERE PersonID IN (SELECT PersonID FROM inserted);
END;

--5. Create trigger that prevent duplicate entries of person name on PersonInfo table.
create trigger tr_stop_duplicate
	on  PersonInfo
	instead of insert
	as
	begin
		insert into PersonInfo (PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)
		select 
			PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate
			from inserted
			where PersonName not in	(
				select PersonName from PersonInfo
			)
	end

	drop trigger tr_stop_duplicate

--6. Create trigger that prevent Age below 18 years.
create or alter trigger tr_Insert_age_below18
	on PersonInfo
	instead of insert
	as
	begin

		insert into PersonInfo (PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)
		select 
			PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate
			from inserted
			where  Age >= 18
	end
	insert into PersonInfo values(1, 'Kavyam', 120000, '1999-12-2', 'Rajkot', 99, '2005-12-24')
	select * from PersonInfo

	drop trigger tr_Insert_age_below18


---------------------------------------------------Part_B---------------------------------


--7. Create a trigger that fires on INSERT operation on person table, which calculates the age and update that age in Person table.
CREATE OR ALTER TRIGGER tr_CalculateAge
ON PersonInfo
AFTER INSERT
AS
BEGIN
    UPDATE PersonInfo
    SET Age = DATEDIFF(YEAR, BirthDate, GETDATE())
    WHERE PersonID IN (SELECT PersonID FROM inserted);
END;

--8. Create a Trigger to Limit Salary Decrease by a 10%.
CREATE OR ALTER TRIGGER tr_LimitSalaryDecrease
ON PersonInfo
AFTER UPDATE
AS
BEGIN
    
END;

insert into PersonInfo values(1, 'Kavyam', 120000, '1999-12-2', 'Rajkot', 99, '2005-12-24')

update PersonInfo 
set Salary=Salary-Salary*0.2
from PersonInfo

select * from PersonInfo

--------------Part C-----------------------------------------
--9. Create Trigger to Automatically Update JoiningDate to Current Date on INSERT if JoiningDate is NULL during an INSERT.
CREATE OR ALTER TRIGGER tr_DefaultJoiningDate
ON PersonInfo
AFTER INSERT
AS
BEGIN
    UPDATE PersonInfo
    SET JoiningDate = GETDATE()
    WHERE JoiningDate IS NULL AND PersonID IN (SELECT PersonID FROM inserted);
END;

--10. Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints ‘Record deleted successfully from PersonLog’.
CREATE OR ALTER TRIGGER tr_DeleteMessage
ON PersonLog
AFTER DELETE
AS
BEGIN
    PRINT 'Record deleted successfully from PersonLog.'
END;