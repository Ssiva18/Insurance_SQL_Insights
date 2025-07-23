/* In SQL, views are virtual tables that are based on the result of a SELECT query. 
view does not store data itself but provides a way to look at data from one or more tables. 
You can think of a view as a saved query that you can use like a regular table. */

--Syntax to create view
	
	CREATE VIEW view_name AS
	SELECT column1, column2, ...
	FROM table_name
	WHERE condition;

	/* Generally what ever the query we write they have to be stored in the name of views,
	   for the reusability of the syntax for the other queries.
	   Views are reusable it manages lot of time, and specially they dosent accupy any sort of memory. */

	CREATE VIEW VW_Policies AS
SELECT 
    POLICIES.PolicyID,  -- example column
    POLICIES.CustomerID,
    POLICIES.PolicyNumber,
    ROW_NUMBER() OVER(PARTITION BY POLICIES.CustomerID ORDER BY POLICIES.CustomerID ASC) AS FLAG
FROM POLICIES
INNER JOIN CUSTOMERS 
    ON CUSTOMERS.CustomerID = POLICIES.CustomerID;

	SELECT FLAG,COUNT(*) AS CNTS FROM VW_POLICIES 
	GROUP BY FLAG 