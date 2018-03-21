Chapter 8a, Data Modiﬁcation
--
Homework questions
--

Homework questions

1. When using INSERT, is the list of columns necessary? Why or why not?

--Specifying the target column names right after the table name is optional, but by doing so, you control the value-column associations instead of relying on the order of the columns in the CREATE TABLE statement. In T-SQL, specifying the INTO clause is optional.

2. When using INSERT SELECT, do you use a subquery (derived table)? Under what circumstances do you not use a subquery?

--When using INSERT SELECT, you are inserting a subquery. The SELECT statement makes whatever follows a subquery, so you would always be using a subquery with INSERT SELECT.

3. What is the operand for the INSERT EXEC statement?

--The operand for the INSERT EXEC statement is the stored procedure.

4. How would you use the INSERT INTO statement?

--The SELECT INTO statement is a nonstandard T-SQL statement that creates a target table and populates it with the result set of a query. The target table’s structure and data are based on the source table. The SELECT INTO statement copies from the source the base structure (such as column names, types, nullability, and identity property) and the data. It does not copy from the source constraints, indexes, triggers, column properties such as SPARSE and FILESTREAM, and permissions. An example of the syntax is: 

    SELECT orderid, orderdate, empid, custid
    INTO dbo.Orders
    FROM Sales.Orders;

5. What are the parameters to the BULK INSERT statement?

--You use the BULK INSERT statement to insert into an existing table data originating from a file. In the statement, you specify the target table, the source file, and options. You can specify many options, including the data file type (for example, char or native), the field terminator, the row terminator, and others—all of which are fully documented.

6. Does IDENTITY guarantee uniqueness? If not, how do you guarantee uniqueness?

--The identity property itself does not enforce uniqueness in the column. You can provide your own explicit values after setting the IDENTITY_INSERT option to ON, and those values can be ones that already exist in rows in the table. Also, you can reseed the current identity value in the table by using the DBCC CHECKIDENT command. If you need to guarantee uniqueness in an identity column, make sure you also define a primary key or a unique constraint on that column.

7. How do you create a SEQUENCE object?

--To create a sequence object, use the CREATE SEQUENCE command. The minimum required information is just the sequence name, but note that the defaults for the various properties in such a case might not be what you want. If you don’t indicate the data type, SQL Server will use BIGINT by default. If you want a different type, indicate AS . The type can be any numeric type with a scale of zero. For example, if you need your sequence to be of an INT type, indicate AS INT. Here is an example of the syntax: 

    CREATE SEQUENCE dbo.SeqOrderIDs AS INT
      MINVALUE 1
      CYCLE;

8. How do you use a SEQUENCE object?

--To generate a new sequence value, you need to invoke the standard function NEXT VALUE FOR <sequence name>. Here’s an example of invoking the function: SELECT NEXT VALUE FOR dbo.SeqOrderIDs;.

9. How do you alter a SEQUENCE object?

You can change any of the sequence properties except the data type with the ALTER SEQUENCE command (MINVAL <val>, MAXVAL <val>, RESTART WITH <val>, INCREMENT BY <val>, CYCLE | NO CYCLE, or CACHE <val> | NO CACHE). For example: ALTER SEQUENCE dbo.SeqOrderIDs NO CYCLE;

10. What is the diﬀerence between DELETE and TRUNCATE?

DELETE uses a WHERE clause to delete only the subset of rows for which the predicate evaluates to TRUE. TRUNCATE has no filter and deletes all the rows from a table.

11. What is the diﬀerence between DELETE and DROP TABLE?11. 

The difference between TRUNCATE and DROP TABLE are that with TRUNCATE, you are left with an empty table that still has the columns. With DROP TABLE, the whole table is gone.

