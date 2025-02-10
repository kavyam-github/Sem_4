----Lab_6--------------


-- Create the Products table
CREATE TABLE Products (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);
-- Insert data into the Products table
INSERT INTO Products (Product_id, Product_Name, Price) VALUES
(1, 'Smartphone', 35000),
(2, 'Laptop', 65000),
(3, 'Headphones', 5500),
(4, 'Television', 85000),
(5, 'Gaming Console', 32000);

select * from Products

-----Part A-----

--1. Create a cursor Product_Cursor to fetch all the rows from a products table.
--Declare @Product_id int ,@Product_Name varchar(100),@Price int
Declare Product_Cursor Cursor
For Select * From Products

open Product_Cursor

Fetch Next from Product_Cursor Into
@Product_id,@Product_Name,@Price

While @@FETCH_STATUS=0
	Begin
		select @Product_id,@Product_Name,@Price
		Fetch Next from Product_Cursor
		Into @Product_id,@Product_Name,@Price

	End

Close Product_Cursor

Deallocate Product_Cursor

---1
--Declare @Product_id int ,@Product_Name varchar(100),@Price int
Declare Product_Cursor Cursor
For Select * From Products

open Product_Cursor

Fetch Next from Product_Cursor Into
@Product_id,@Product_Name,@Price

While @@FETCH_STATUS=0
	Begin
		Print(cast(@Product_id as varchar(100))+' '+ @Product_Name+' '+cast(@Price as varchar(100)))
		Fetch Next from Product_Cursor
		Into @Product_id,@Product_Name,@Price

	End

Close Product_Cursor

Deallocate Product_Cursor

--2.Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName.
--(Example: 1_Smartphone)
Declare @Product_id int,@Product_Name varchar(100) 
Declare Product_Cursor_Fetch cursor
for select Product_id, Product_Name from Products

open Product_Cursor_Fetch

fetch next from Product_Cursor_Fetch 
into @Product_id , @Product_Name 

while @@FETCH_STATUS = 0
                      begin
					  print  cast(@Product_id  as varchar(100)) +'_'+ @Product_Name
					  fetch next from Product_Cursor_Fetch 
                      into @Product_id , @Product_Name
                      end 

close Product_Cursor_Fetch
deallocate Product_Cursor_Fetch

--3. Create a Cursor to Find and Display Products Above Price 30,000.
Declare  @Product_Name2 varchar(100) , @Price1 int

Declare Cursor_Display_Above_30000 cursor
for select Product_Name,Price from Products

open Cursor_Display_Above_30000

fetch next from Cursor_Display_Above_30000 
into  @Product_Name2,@Price1

while @@FETCH_STATUS = 0
                      begin
					  if (@Price1 >30000)
					      print  @Product_Name2+ '_'+cast(@Price1  as varchar(100))  
					  fetch next from Cursor_Display_Above_30000 
                      into  @Product_Name2,@Price1
                      end 

close Cursor_Display_Above_30000
deallocate Cursor_Display_Above_30000

--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
declare @Product_id3 int, @Product_Name3 varchar(100), @Price3 int

Declare Cursor_Product_CursorDelete cursor
for select Product_id, Product_Name, Price from Products

open Cursor_Product_CursorDelete

fetch next from Cursor_Product_CursorDelete 
into  @Product_id3,@Product_Name3,@Price3

while @@FETCH_STATUS = 0
                      begin
					  delete from Products
					  where  Product_id=@Product_id3 and Product_Name=@Product_Name3 and Price=@Price3
					  fetch next from Cursor_Product_CursorDelete 
                      into  @Product_id3,@Product_Name3,@Price3
                      end 
print('Deleted Successfully')
close Cursor_Product_CursorDelete
deallocate Cursor_Product_CursorDelete

--Part_B
--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases the price by 10%.
Declare @Price4 int
Declare Product_CursorUpdate cursor
for select Price from Products
open Product_CursorUpdate
fetch next from Product_CursorUpdate into @Price4 
while @@FETCH_STATUS=0
	begin 
	update Products
	Set Price=Price+Price*0.1
	where Price=@Price4 
	fetch next from Product_CursorUpdate into @Price4 
	end
Print('Updated Successfully')
close Product_CursorUpdate
Deallocate Product_CursorUpdate

--6. Create a Cursor to Rounds the price of each product to the nearest whole number
Declare @Price5 int
Declare Product_CursorRound cursor
for select Price from Products
open Product_CursorRound
fetch next from Product_CursorRound into @Price5 
while @@FETCH_STATUS=0
	begin 
	update Products
	Set Price=ROUND(Price,0)
	where Price=@Price5 
	fetch next from Product_CursorRound into @Price5 
	end
Print('Updated Successfully')
close Product_CursorRound
Deallocate Product_CursorRound