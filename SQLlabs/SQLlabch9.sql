---------------------------------------------------------------------
-- Microsoft SQL Server T-SQL Fundamentals
-- Chapter 09 - Temporal Tables
-- © Itzik Ben-Gan 
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Creating Tables
---------------------------------------------------------------------

USE TSQLV4;

/*
-- Run the following code for cleanup
IF OBJECT_ID(N'dbo.Employees', N'U') IS NOT NULL
BEGIN
  IF OBJECTPROPERTY(OBJECT_ID(N'dbo.Employees', N'U'), N'TableTemporalType') = 2
    ALTER TABLE dbo.Employees SET ( SYSTEM_VERSIONING = OFF );
  DROP TABLE IF EXISTS dbo.EmployeesHistory, dbo.Employees;
END;
*/

-- Create Employees table
CREATE TABLE dbo.Employees
(
  empid      INT                         NOT NULL
    CONSTRAINT PK_Employees PRIMARY KEY NONCLUSTERED,
  empname    VARCHAR(25)                 NOT NULL,
  department VARCHAR(50)                 NOT NULL,
  salary     NUMERIC(10, 2)              NOT NULL,
  sysstart   DATETIME2(0)
    GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
  sysend     DATETIME2(0)
    GENERATED ALWAYS AS ROW END   HIDDEN NOT NULL,
  PERIOD FOR SYSTEM_TIME (sysstart, sysend),
  INDEX ix_Employees CLUSTERED(empid, sysstart, sysend)
)
WITH ( SYSTEM_VERSIONING = ON ( HISTORY_TABLE = dbo.EmployeesHistory ) );
GO

-- Alter existing nontemporal table to be temporal
/*
ALTER TABLE dbo.Employees ADD
  sysstart DATETIME2(0) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL
    CONSTRAINT DFT_Employees_sysstart DEFAULT('19000101'),
  sysend DATETIME2(0) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL
    CONSTRAINT DFT_Employees_sysend DEFAULT('99991231 23:59:59'),
  PERIOD FOR SYSTEM_TIME (sysstart, sysend);

ALTER TABLE dbo.Employees
  SET ( SYSTEM_VERSIONING = ON ( HISTORY_TABLE = dbo.EmployeesHistory ) );
*/

-- Query the table using *
SELECT *
FROM dbo.Employees;

-- Query the table using explicit column list
SELECT empid, empname, department, salary, sysstart, sysend
FROM dbo.Employees;

-- Altering an existing table
ALTER TABLE dbo.Employees
  ADD hiredate DATE NOT NULL
    CONSTRAINT DFT_Employees_hiredate DEFAULT('19000101');

SELECT *
FROM dbo.Employees;

SELECT *
FROM dbo.EmployeesHistory;

-- Drop default from Employees
ALTER TABLE dbo.Employees
  DROP CONSTRAINT DFT_Employees_hiredate;

-- Drop column
ALTER TABLE dbo.Employees
  DROP COLUMN hiredate;

---------------------------------------------------------------------
-- Modifying Data
---------------------------------------------------------------------

-- Add rows
INSERT INTO dbo.Employees(empid, empname, department, salary)
  VALUES(1, 'Sara', 'IT'       , 50000.00),
        (2, 'Don' , 'HR'       , 45000.00),
        (3, 'Judy', 'Sales'    , 55000.00),
        (4, 'Yael', 'Marketing', 55000.00),
        (5, 'Sven', 'IT'       , 45000.00),
        (6, 'Paul', 'Sales'    , 40000.00);

-- Query data
SELECT empid, empname, department, salary, sysstart, sysend
FROM dbo.Employees;

SELECT empid, empname, department, salary, sysstart, sysend
FROM dbo.EmployeesHistory;

-- Delete a row
DELETE FROM dbo.Employees
WHERE empid = 6;

-- Update rows
UPDATE dbo.Employees
  SET salary *= 1.05
WHERE department = 'IT';

-- Run the following first
BEGIN TRAN;

UPDATE dbo.Employees
  SET department = 'Sales'
WHERE empid = 5;
GO

-- Run the following next
UPDATE dbo.Employees
  SET department = 'IT'
WHERE empid = 3;

COMMIT TRAN;

---------------------------------------------------------------------
-- Querying Data
---------------------------------------------------------------------

-- Code to populate the tables with the same sample data as in the book
USE TSQLV4;

-- Drop tables if exist
IF OBJECT_ID(N'dbo.Employees', N'U') IS NOT NULL
BEGIN
  IF OBJECTPROPERTY(OBJECT_ID(N'dbo.Employees', N'U'), N'TableTemporalType') = 2
    ALTER TABLE dbo.Employees SET ( SYSTEM_VERSIONING = OFF );
  DROP TABLE IF EXISTS dbo.EmployeesHistory, dbo.Employees;
END;
GO

-- Create and populate Employees table
CREATE TABLE dbo.Employees
(
  empid      INT            NOT NULL
    CONSTRAINT PK_Employees PRIMARY KEY NONCLUSTERED,
  empname    VARCHAR(25)    NOT NULL,
  department VARCHAR(50)    NOT NULL,
  salary     NUMERIC(10, 2) NOT NULL,
  sysstart   DATETIME2(0)   NOT NULL,
  sysend     DATETIME2(0)   NOT NULL,
  INDEX ix_Employees CLUSTERED(empid, sysstart, sysend)
);

INSERT INTO dbo.Employees(empid, empname, department, salary, sysstart, sysend) VALUES
  (1 , 'Sara', 'IT'       , 52500.00, '2016-02-16 17:20:02', '9999-12-31 23:59:59'),
  (2 , 'Don' , 'HR'       , 45000.00, '2016-02-16 17:08:41', '9999-12-31 23:59:59'),
  (3 , 'Judy', 'IT'       , 55000.00, '2016-02-16 17:28:10', '9999-12-31 23:59:59'),
  (4 , 'Yael', 'Marketing', 55000.00, '2016-02-16 17:08:41', '9999-12-31 23:59:59'),
  (5 , 'Sven', 'Sales'    , 47250.00, '2016-02-16 17:28:10', '9999-12-31 23:59:59');

-- Create and populate EmployeesHistory table
CREATE TABLE dbo.EmployeesHistory
(
  empid      INT            NOT NULL,
  empname    VARCHAR(25)    NOT NULL,
  department VARCHAR(50)    NOT NULL,
  salary     NUMERIC(10, 2) NOT NULL,
  sysstart   DATETIME2(0)   NOT NULL,
  sysend     DATETIME2(0)   NOT NULL,
  INDEX ix_EmployeesHistory CLUSTERED(sysend, sysstart)
    WITH (DATA_COMPRESSION = PAGE)
);

INSERT INTO dbo.EmployeesHistory(empid, empname, department, salary, sysstart, sysend) VALUES
  (6 , 'Paul', 'Sales' , 40000.00, '2016-02-16 17:08:41', '2016-02-16 17:15:26'),
  (1 , 'Sara', 'IT'    , 50000.00, '2016-02-16 17:08:41', '2016-02-16 17:20:02'),
  (5 , 'Sven', 'IT'    , 45000.00, '2016-02-16 17:08:41', '2016-02-16 17:20:02'),
  (3 , 'Judy', 'Sales' , 55000.00, '2016-02-16 17:08:41', '2016-02-16 17:28:10'),
  (5 , 'Sven', 'IT'    , 47250.00, '2016-02-16 17:20:02', '2016-02-16 17:28:10');

-- Enable system versioning
ALTER TABLE dbo.Employees ADD PERIOD FOR SYSTEM_TIME (sysstart, sysend);

ALTER TABLE dbo.Employees ALTER COLUMN sysstart ADD HIDDEN;
ALTER TABLE dbo.Employees ALTER COLUMN sysend ADD HIDDEN;

ALTER TABLE dbo.Employees
  SET ( SYSTEM_VERSIONING = ON ( HISTORY_TABLE = dbo.EmployeesHistory ) );

-- Current state
SELECT *
FROM dbo.Employees;

-- FOR SYSTEM_TIME AS OF @datetime
-- sysstart <= @datetime AND sysend > @datetime
-- Validity interval starts on or before @datetime and ends after datetime

SELECT *
FROM dbo.Employees FOR SYSTEM_TIME AS OF '2016-02-16 17:00:00';

SELECT *
FROM dbo.Employees FOR SYSTEM_TIME AS OF '2016-02-16 17:10:00';

-- Can query different points in time
SELECT T2.empid, T2.empname,
  CAST( (T2.salary / T1.salary - 1.0) * 100.0 AS NUMERIC(10, 2) ) AS pct
FROM dbo.Employees FOR SYSTEM_TIME AS OF '2016-02-16 17:10:00' AS T1
  INNER JOIN dbo.Employees FOR SYSTEM_TIME AS OF '2016-02-16 17:25:00' AS T2
    ON T1.empid = T2.empid
   AND T2.salary > T1.salary;

-- FOR SYSTEM_TIME FROM @start TO @end 
-- sysstart < @end AND sysend > @start
-- Validity interval starts before input interval ends and ends after input interval starts

SELECT empid, empname, department, salary, sysstart, sysend
FROM dbo.Employees
  FOR SYSTEM_TIME FROM '2016-02-16 17:15:26' TO '2016-02-16 17:20:02';

SELECT empid, empname, department, salary, sysstart, sysend
FROM dbo.Employees
  FOR SYSTEM_TIME BETWEEN '2016-02-16 17:15:26' AND '2016-02-16 17:20:02';

-- FOR SYSTEM_TIME CONTAINED IN(@start, @end)
-- sysstart >= @start AND sysend <= @end
-- Validity interval starts on or after input interval starts and ends on or before input interval ends

SELECT empid, empname, department, salary, sysstart, sysend
FROM dbo.Employees
  FOR SYSTEM_TIME CONTAINED IN('2016-02-16 17:00:00', '2016-02-16 18:00:00');

-- FOR SYSTEM_TIME ALL
SELECT empid, empname, department, salary, sysstart, sysend
FROM dbo.Employees FOR SYSTEM_TIME ALL;

-- To see start and end times in specific time zone instead of UTC
SELECT empid, empname, department, salary, 
  sysstart AT TIME ZONE 'UTC' AT TIME ZONE 'Pacific Standard Time' AS sysstart,
  CASE
    WHEN sysend = '9999-12-31 23:59:59'
      THEN sysend AT TIME ZONE 'UTC'
    ELSE sysend AT TIME ZONE 'UTC' AT TIME ZONE 'Pacific Standard Time'
  END AS sysend
FROM dbo.Employees FOR SYSTEM_TIME ALL;

-- Run the following code for cleanup
IF OBJECT_ID(N'dbo.Employees', N'U') IS NOT NULL
BEGIN
  IF OBJECTPROPERTY(OBJECT_ID(N'dbo.Employees', N'U'), N'TableTemporalType') = 2
    ALTER TABLE dbo.Employees SET ( SYSTEM_VERSIONING = OFF );
  DROP TABLE IF EXISTS dbo.EmployeesHistory, dbo.Employees;
END;