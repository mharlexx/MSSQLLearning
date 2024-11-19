

-- ****************** DATABASE & TABLE CONSTRUCTION & MANIPULATION ******************

CREATE DATABASE EmployeeDB; -- CREATE DATABASE

USE EmployeeDB; -- EQUIP DATABASE WITH THIS CODE

--------------------------- CREATE TABLE WITH COLUMNS ---------------------------

CREATE TABLE TestTable ( -- TABLE WITH ALL THE DATATYPE

    ID INT PRIMARY KEY,                   -- Integer
    Name NVARCHAR(50),                    -- Variable-length Unicode string
    Age TINYINT,                          -- Small integer (0-255)
    Height FLOAT,                         -- Approximate numeric (floating-point)
    BirthDate DATE,                       -- Date only
    HireTime TIME,                        -- Time only
    LastUpdated DATETIME,                 -- Date and time
    IsActive BIT,                         -- Boolean-like (0 or 1)
    Salary DECIMAL(10, 2),                -- Exact numeric (fixed precision and scale)
    Comments TEXT,                        -- Large text data (deprecated, use NVARCHAR(MAX))
    ProfilePicture VARBINARY(MAX),        -- Binary data (e.g., images, files)
    GuidColumn UNIQUEIDENTIFIER,          -- Globally unique identifier (GUID)
    CreatedAt SMALLDATETIME,              -- Smaller datetime range (less precision)
    GeoLocation GEOGRAPHY,                -- Spatial data (e.g., lat/long)
    XmlData XML                           -- XML data type

);

CREATE TABLE Employees ( -- SAMPLE TABLE

	EmployeeID INT PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	HireDate DATE NOT NULL

);

--------------------------- CREATE TABLE WITH COLUMNS ---------------------------

ALTER TABLE Employees -- ADD COLUMN
ADD Salary DECIMAL(10,2) NULL;

ALTER TABLE Employees -- DELETE COLUMN
DROP COLUMN Salary; 

DROP TABLE TestTable; -- DELETE TABLE

DELETE FROM Employees -- DLETE DATA FROM TABLE 
WHERE EmployeeID IN (1, 2);

INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, Salary) --- ADD DATA 
VALUES (1, 'Mharlex', 'Basilio', '2024-01-12', 20000.00),
	   (2, 'Maika', 'Calinog', '2024-08-31', 20000.00);

UPDATE Employees --- EDIT/UPDATE DATA 
SET Salary = 18000.00
WHERE EmployeeID = 1;

UPDATE Employees --- EDIT/UPDATE DATA 
SET Salary = 45000.00
WHERE EmployeeID = 2;

-- ****************** DATABASE & TABLE CONSTRUCTION & MANIPULATION ******************

-- ********************************* MAIN EXECUTION *********************************

EXEC AddSalariesOfEmployees @EmployeeID1 = 1, @EmployeeID2 = 2; 

-- ********************************* MAIN EXECUTION *********************************

-- ******************************* STORED PROCEDURES ********************************

CREATE PROCEDURE AddSalariesOfEmployees
    @EmployeeID1 INT,
    @EmployeeID2 INT
AS
BEGIN
    DECLARE @Salary1 DECIMAL(10, 2);
    DECLARE @Salary2 DECIMAL(10, 2);
    DECLARE @TotalSalary DECIMAL(10, 2);

    -- Get the Salary for the first employee
    SELECT @Salary1 = Salary
    FROM Employees
    WHERE EmployeeID = @EmployeeID1;

    -- Get the Salary for the second employee
    SELECT @Salary2 = Salary
    FROM Employees
    WHERE EmployeeID = @EmployeeID2;

    -- Calculate the total salary
    SET @TotalSalary = @Salary1 + @Salary2;

    -- Return the total salary
    SELECT @TotalSalary AS TotalSalary;
END;

-- ******************************* STORED PROCEDURES ********************************