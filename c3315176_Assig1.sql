--create table if it doesn't exist
--reference: https://stackoverflow.com/questions/59641684/create-database-if-db-not-exist
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'C3315176_INFT3050_A1')
BEGIN
    CREATE DATABASE C3315176_INFT3050_A1
END
go
USE C3315176_INFT3050_A1
--delete foreign key constraints
--reference: https://social.msdn.microsoft.com/Forums/sqlserver/en-US/730b7082-2ceb-49e2-a052-68e6b2c25bb5/how-to-delete-all-foreign-keys-in-a-database?forum=databasedesign
while(exists(select 1 from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE='FOREIGN KEY'))
begin
	declare @sql nvarchar(2000)
	SELECT TOP 1 @sql=('ALTER TABLE ' + TABLE_SCHEMA + '.[' + TABLE_NAME
	+ '] DROP CONSTRAINT [' + CONSTRAINT_NAME + ']')
	FROM information_schema.table_constraints
	WHERE CONSTRAINT_TYPE = 'FOREIGN KEY'
	exec (@sql)
end

DROP TABLE IF EXISTS [User];
DROP TABLE IF EXISTS Cart;
DROP TABLE IF EXISTS [Transaction];
DROP TABLE IF EXISTS Product;
go

CREATE TABLE [User] (
	emailID			VARCHAR(250) NOT NULL,
	firstName		VARCHAR(30) NOT NULL,
	lastName		VARCHAR(30) NOT NULL,
	DOB				DATE NOT NULL,
	password		VARCHAR(20) NOT NULL,
	admin			VARCHAR(5) NOT NULL,
	active			VARCHAR(9) NOT NULL,
	PRIMARY KEY (emailID)
	);
go

CREATE TABLE Cart (
    sessionID		VARCHAR(20) NOT NULL,
	emailID			VARCHAR(250) NOT NULL,
    itemsInCart		VARCHAR(500),
	cartTotal		FLOAT(8) NOT NULL,
	PRIMARY KEY (sessionID),
	FOREIGN KEY (emailID) REFERENCES [User](emailID) ON UPDATE CASCADE ON DELETE NO ACTION
	);
go

CREATE TABLE [Transaction] (
    transactionNo		INT NOT NULL,
	postageAddress		VARCHAR(250) NOT NULL,
	emailID				VARCHAR(250) NOT NULL,
	cardNumber			CHAR(16) NOT NULL,
	cardCVC				INT NOT NULL,
	itemsPurchased		VARCHAR(500),
	PRIMARY KEY (transactionNo),
	FOREIGN KEY (emailID) REFERENCES [User](emailID) ON UPDATE CASCADE ON DELETE NO ACTION
	);
go

CREATE TABLE Product (
	itemCode		VARCHAR(10) NOT NULL,
	character		VARCHAR(100) NOT NULL,
	outfit			VARCHAR(100),
	series			VARCHAR(100) NOT NULL,
	available		VARCHAR(5) NOT NULL,
	stock			INT NOT NULL,
	description		VARCHAR(500),
	PRIMARY KEY (itemCode)
	);
go

--Data creation

INSERT INTO [User] VALUES
('fakestudent@uon.edu.au', 'Jeremy', 'Anderson', '1999-07-31', 'Password!', 'true', 'active'),
('fakeaccount@gmail.com', 'Test', 'Person', '2000-01-01', 'Password!', 'false', 'active')
go

INSERT INTO [Product] VALUES
('MARWV001', 'Wanda Maximoff', 'Scarlet Witch', 'WandaVision', 'true', 30, 'Scarlet Witch from the hit series Wandavision!'),
('MARWV002', 'Vision', 'White Vision', 'WandaVision', 'true', 40, 'The brand new Vision appearance from the hit series Wandavision!'),
('MAREG001', 'Tony Stark', 'Iron Man Nano Gauntlet', 'Avengers Endgame', 'false', 0, 'Tony Starks final act for the fate of the universe!')
go

--Display data
SELECT * FROM [User]
SELECT * FROM [Product]

