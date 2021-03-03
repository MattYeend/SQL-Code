--Create tables
create table Persons(
PersonID int not null primary key,
LastName varchar(255),
FirstName varchar(255),
Address varchar (255),
City varchar(255),
Salary int
);

create table orders(
OrderID int not null Primary Key,
PersonID int,
ProductName varchar(20),
OrderDate timestamp
);

--Input data into tables
insert into Persons(LastName, FirstName, Address, City, Salary)
values ('Smith', 'Alan', '123 ABC', 'London', 20000),
('Williams', 'John', '456 DEF', 'Leicester', 32000),
('Hughes', 'William', 'ABC DEF', 'Cardiff', 24000);

insert into Orders(ProductName, Amount)
values ('Screw', 5),
('Hammer', 10),
('Nail', 7),
('Wood', 20);

--Views
create view View1 as
select FirstName, LastName
from Persons
where LastName = 'Hughes';

--Joins
select OrderDate
from Persons
join Orders
on Persons.PersonID = Orders.PersonID
where PersonID = 1;

--To show Parts with the part description contains the Hexadecimal of 0x1E in the company ISC
Select P.PartNum, P.PartDescription
From Part P
       Where P.Company = 'ISC'
       And P.PartDescription like '%' + char(0x1E) + '%'

--To show Jobs with order sequence and comment text where the comment text contains the Hexadecimal 0x1E
Select X.JobNum, X.OprSeq, X.CommentText
From JobOper X
       Where X.CommentText like '%' + char(0x1E) + '%'

--To show Parts with revisions, order sequences, and comment text where the comment text contains the Hexadecimal 0x1E
Select X.PartNum, X.RevisionNum, X.OprSeq, X.CommentText
From PartOpr X
       Where X.CommentText like '%' + char(0x1E) + '%'

--To show Orders with comments with a quantity of 4
Select X.OrderNum, X.OrderLine, X.OrderComment, X.OrderQty
From OrderDtl X
       Where X.OrderComment like '%' + ' ' + '%'
       And X.OrderQty = 1

--To show Parts with LotBatch and OnHold where the OnHold quantity is equal to 1
Select X.PartNum, X.PartDescription, X.LotBatch, X.OnHold
From Part X
       Where X.PartDescription like '%' + ' ' + '%'
       And X.OnHold = 1

--To show Jobs, with parts, description, parts per operation, part quantity, stock quantity, shipped quantity, and received quantity with the part description populated
Select X.JobNum, X.PartNum,X.PartDescription, X.PartsPerOp, X.PartQty, X.StockQty, X.ShippedQty, X.ReceivedQty
From JobPart X
       Where X.PartDescription like '%' + ' ' + '%'

--To show the Company, operation sequence, parts, revisions, operation code, machines, and comment text where the comment text is populated, the revision is D, and the operation sequence is 70
Select X.Company, X.OprSeq, X.PartNum, X.RevisionNum, X.OpCode, X.Machines, X.CommentText
From PartOpr X
       Where X.CommentText like '%' + ' ' + '%'
       And X.RevisionNum like 'D'
       And X.OprSeq = 70

--To show the Orders, customer numbers, PO numbers, if it is an open number, and order comments where the order comments is populated
Select X.OrderNum, X.CustNum, X.PONum, X.OpenOrder, X.OrderComment
From OrderHed X
       Where X.OrderComment like '%' + ' ' + '%'

--Brings back the same field names as above but when the order comment has the Hexadecimal value of 0x1E
Select X.OrderNum, X.CustNum, X.PONum, X.OpenOrder, X.OrderComment
From OrderHed X
       Where X.OrderComment like '%' + char(0x1E) + '%'

--To show Parts, description, and unit price, in which the unit price is greater than 0
Select X.PartNum, PartDescription, X.UnitPrice
From Part X
       Where X.UnitPrice > 0

--To show all data from the Parts table
Select *
From Part

--To show Parts, with part description, search word, and type code, where the type code is P
Select X.PartNum, X.PartDescription, X.SearchWord, X.TypeCode
From Part X
       Where X.TypeCode = 'P'

--To show Jobs, with parts, IUM, required quantity, and material sequence, with the required quantity and material sequence greater than 0
Select X.JobNum, X.PartNum, X.IUM, X.RequiredQty, X.MtlSeq
From JobMtl X
       Where X.RequiredQty > 0
       And X.MtlSeq > 0

--To show Jobs, with parts, revision number, draw number, and product quantity, where the product quantity is greater than 1000
Select X.JobNum, X.PartNum, X.RevisionNum, X.DrawNum, X.ProdQty
From JobHead X
       Where X.ProdQty > 1000

--To show Jobs, with parts, description, and material sequence, where the material sequence is equal to or greater than 40 and the description contains the Hexadecimal value of 0x1E
Select J.JobNum, J.PartNum, J.Description, J.MtlSeq
From JobMtl J
       Where J.MtlSeq >= 40
       And J.Description like '%' + char(0x1E) + '%'

--To show all information in the part table where the part description contains 'kara'
Select *
From Part P
       Where P.PartDescription like '%' + 'kara' + '%'

--To show all information in the Purchase Order Detail line, where the PO Line is greater than 6, the order quantity is greater than 600, and the comment text is populated 
Select *
From PODetail X
       Where X.POLine > 6
       And X.OrderQty > 600
       And X.CommentText like '%' + ' ' + '%'

--To show all parts in the Parts table that have no Track Lots and are active
select * from Part P where TrackLots = 0 and InActive = 0
