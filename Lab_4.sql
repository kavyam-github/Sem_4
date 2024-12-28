-------Lab_8
-----Part_A

--1. Write a function to print "hello world".
CREATE OR ALTER FUNCTION FR_HELLOWORLD()
	RETURNS VARCHAR(100)
AS
BEGIN
	RETURN 'HELLO WORLD';
END

SELECT DBO.FR_HELLOWORLD();

--2. Write a function which returns addition of two numbers.
CREATE OR ALTER FUNCTION FR_ADDTWONUMBERS(@NUM1 INT,@NUM2 INT)
	RETURNS INT
AS
BEGIN
	RETURN @NUM1+@NUM2;
END

SELECT DBO.FR_ADDTWONUMBERS(4,5) as Addition;

--3. Write a function to check whether the given number is ODD or EVEN.
CREATE OR ALTER FUNCTION FR_EVENORODD(@NUM INT)
	RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @RESULT VARCHAR(10)
	IF @NUM%2=0
		SET @RESULT='EVEN'
	ELSE
		SET @RESULT='ODD'
	RETURN @RESULT
END

SELECT DBO.FR_EVENORODD(7);

--4. Write a function which returns a table with details of a person whose first name starts with B.
CREATE OR ALTER FUNCTION FR_PERSON_FIRSTNAMEWITHB()
	RETURNS TABLE
AS
	RETURN(SELECT * FROM PERSON WHERE FIRSTNAME LIKE 'B%');

SELECT * FROM FR_PERSON_FIRSTNAMEWITHB();

---5. Write a function which returns a table with unique first names from the person table
CREATE OR ALTER FUNCTION FR_FIRSTNAME()
	RETURNS TABLE
AS 
	RETURN(SELECT DISTINCT FirstName from Person);

select * from FR_FIRSTNAME()

----6. Write a function to print number from 1 to N. (Using while loop)
CREATE OR ALTER FUNCTION FR_NUM_1_N(@NUM INT )
	RETURNS VARCHAR(100)
AS BEGIN
	DECLARE @I INT=1
	DECLARE @N VARCHAR(100)=' '
	WHILE @I<=@NUM
	BEGIN 
		SET @N=@N+CAST(@I AS varchar)+' '
		SET @I=@I+1
	END
	RETURN @N
END

SELECT DBO.FR_NUM_1_N(5)

----7. Write a function to find the factorial of a given integer.
CREATE OR ALTER FUNCTION FR_FACTORIAL(@NUM INT )
	RETURNS VARCHAR(100)
AS BEGIN
	DECLARE @I INT=1
	DECLARE @FACT INT=1
	WHILE @I<=@NUM
	BEGIN 
		SET @FACT=@FACT*@I
		SET @I=@I+1
	END
	RETURN @FACT
END

SELECT DBO.FR_FACTORIAL(5)AS FACTORIAL

----PART_B--------------------------------------------------------------------

--8. Write a function to compare two integers and return the comparison result. (Using Case statement)
CREATE OR ALTER FUNCTION FR_COMPARISON(@NUM1 INT, @NUM2 INT)
	RETURNS VARCHAR(100)
AS BEGIN
	DECLARE @RESULT  VARCHAR(50)
	SET @RESULT=CASE
		WHEN @NUM1>@NUM2 THEN 'INTEGER1 IS GREATER THAN INTEGER2'
		WHEN @NUM1<@NUM2 THEN 'INTEGER2 IS GREATER THAN INTEGER1'
		ELSE 'INTEGER1 AND INTEGER2 ARE EQUAL'
		END
	RETURN @RESULT
END
SELECT DBO.FR_COMPARISON(4,5);

---9. Write a function to print the sum of even numbers between 1 to 20.
Create or Alter Function FR_EvenSum()
	Returns int
as begin 
	Declare @Sum int=0,@I int=1;
	While @I<=20
		Begin
			IF @I%2=0
				Set @Sum=@Sum+@I;
			Set @I=@I+1
		End
	Return @Sum 
End

SELECT DBO.FR_EvenSum() as EvenSum;

--10
Create or Alter function FR_Palindrome(@string varchar(100))
	returns varchar(100)
as
begin
	declare @reverse varchar(100) = reverse(@string);
	declare @result varchar(100);
	if @string = @reverse
		set @result = 'Palindrome'
	else
		set @result = 'Not Palindrome'
	return @result
end

select dbo.FR_Palindrome('16461');

----Part_C-------

--11
--Note: for Table valued function use tables of Lab-2
--Part – A
--1. Write a function to print "hello world".
create or alter function FN_HelloWorld()
	returns varchar(100)
as
begin
	return 'Hello World'
end

select dbo.FN_HelloWorld()

--2. Write a function which returns addition of two numbers.
create or alter function FN_AddNumber(@num1 int, @num2 int)
	returns int
as
begin
	return @num1 + @num2
end

select dbo.FN_AddNumber(2, 3)

--3. Write a function to check whether the given number is ODD or EVEN.
create or alter function FN_OddOrEven(@num int)
	returns varchar(100)
as
begin
	declare @result varchar(10)
	if @num % 2 = 0
		set @result = 'Even'
	else
		set @result = 'Odd'
	return @result
end

select dbo.FN_OddOrEven(5)

--4. Write a function which returns a table with details of a person whose first name starts with B.
create or alter function FN_Person_FirstNameWithB()
	returns table
as
	return (select * from Person where FirstName like 'B%')

select * from dbo.FN_Person_FirstNameWithB()

--5. Write a function which returns a table with unique first names from the person table.
create or alter function FN_Person_UniqueFirstName()
	returns table
as
	return (select distinct FirstName from Person)

select * from dbo.FN_Person_UniqueFirstName()

--6. Write a function to print number from 1 to N. (Using while loop)
create or alter function FN_Print1ToN(@num int)
	returns varchar(100)
as
begin
	declare @i int = 1;
	declare @n varchar(100) = '';
	while @i <= @num
		begin
			set @n= @n + cast(@i as varchar)+ ' '
			set @i = @i + 1
		end
	return @n
end

select dbo.FN_Print1ToN(5)

--7. Write a function to find the factorial of a given integer.
create or alter function FN_Factorial(@num int)
	returns int
as
begin
	declare @fac int = 1;
	declare @i int = 1;
	while @i <= @num
		begin
			set @fac = @fac * @i
			set @i = @i + 1
		end
	return @fac
end

select dbo.FN_Factorial(5)

--Part – B
--8. Write a function to compare two integers and return the comparison result. (Using Case statement)
create or alter function FN_CompareIntegers(@Integer1 int, @Integer2 int)
	returns varchar(50)
as
begin
    declare @Result varchar(50)

    set @Result = case
                    when @Integer1 > @Integer2 then 'Integer1 is greater than Integer2'
                    when @Integer1 < @Integer2 then 'Integer2 is greater than Integer1'
                    else 'Integer1 is equal to Integer2'
				end
    return @Result
end

select dbo.FN_CompareIntegers(5, 9)

--9. Write a function to print the sum of even numbers between 1 to 20.
create or alter function FN_EvenSum1To20()
	returns int
as
begin
	declare @result int = 0;
	declare @i int = 1;
	while @i <= 20
		begin
			if @i % 2 = 0
				set @result = @result + @i
			set @i = @i + 1
		end
	return @result
end

select dbo.FN_EvenSum1To20()

--10. Write a function that checks if a given string is a palindrome
create or alter function FN_Palindrome(@string varchar(100))
	returns varchar(100)
as
begin
	declare @reverse varchar(100) = reverse(@string);
	declare @result varchar(100);
	if @string = @reverse
		set @result = 'Palindrome'
	else
		set @result = 'Not Palindrome'
	return @result
end

select dbo.FN_Palindrome('121')

--Part – C
--11. Write a function to check whether a given number is prime or not.
create or alter function FN_PrimeNumber(@num int)
	returns varchar(100)
as
begin
	declare @result varchar(10);
	if @num = 1
		begin
			set @result = 'Not Prime'
			return @result
		end
	declare @count int = 0;
	declare @i int = 2;
	while @i <= @num / 2
		begin
			if @num % @i = 0
				set @count = @count + 1
				set @i = @i + 1
		end
	if @count = 0
		set @result = 'Prime'
	else
		set @result = 'Not Prime'
	return @result
end

select dbo.FN_PrimeNumber(7)

--12
create or alter function FN_DateDifference(@Start datetime, @End datetime)
	returns int
as
begin
	return datediff(day, @Start, @End)
end

select dbo.FN_DateDifference('2024-12-01', '2024-12-10')

--13
create or alter function FN_GetDaysInMonthYear(@Year INT, @Month INT)
	returns int
as
begin
    return case 
                when @Month in (1, 3, 5, 7, 8, 10, 12) then 31
                when @Month in (4, 6, 9, 11) then 30
                when @Month = 2 and ((@Year % 4 = 0 and @Year % 100 != 0) or @Year % 400 = 0) then 29
                when @Month = 2 then 28
                else 0
            end
end

select dbo.FN_GetDaysInMonthYear(2024, 2)

--14
create or alter function FN_PersonDetails(@DepartmentID int)
	returns table
as
	return (select * from Person where DepartmentID = @DepartmentID)

select * from dbo.FN_PersonDetails(1)

--15
create or alter function FN_Persondetails_JoiningDate()
	returns table
as
	return (select * from Person where JoiningDate > '1991-01-01')

select * from dbo.FN_Persondetails_JoiningDate()
		