/*
we will develop a project for a Insurance company. 
This project will cover creating a database, tables, and indexes, inserting data
and writing various queries for reporting and data analysis.
Project Overview: WNS Insurance Company

A. DataBase Design
	-- Database Name: Insurance_Project

B. Tables:
	-- Customer & Demographics
	-- Policies
	-- Premiums & Payments
	-- Claims
	-- Underwriting & Risk Assessment
	-- Agents & Brokers
	-- Products
	-- Regulatory & Compliance
	-- External Data (Enrichment)
	-- Operational & Technical

	*/
    
    create database Insurance_Project
    Use Insurance_Project
    GO

 -- Customers
	CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(100),
    DOB DATE,
    Email NVARCHAR(100)
    );
    GO

-- Customers Data

    INSERT INTO Customers VALUES
    (1, 'Alice Johnson', '1985-04-12', 'alice@example.com'),
    (2, 'Bob Smith', '1990-08-25', 'bob@example.com'),
    (3, 'Charlie Evans', '1982-02-20', 'charlie@example.com'),
    (4, 'Diana Lee', '1975-09-12', 'diana@example.com'),
    (5, 'Ethan Brown', '1995-11-01', 'ethan@example.com');
    GO

-- Policies
    CREATE TABLE Policies (
        PolicyID VARCHAR(10) PRIMARY KEY,
        CustomerID INT,
        PolicyNumber NVARCHAR(50),
        PolicyType NVARCHAR(50),
        Status NVARCHAR(20),
        EffectiveDate DATE,
        ExpiryDate DATE,
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    );
    GO

-- Policies Data

    INSERT INTO Policies VALUES
    ('P101', 1, 'POL123', 'Auto', 'Active', '2024-01-01', '2025-01-01'),
    ('P102', 1, 'POL456', 'Home', 'Expired', '2023-05-15', '2024-05-14'),
    ('P103', 3, 'POL789', 'Life', 'Active', '2023-02-01', '2026-02-01'),
    ('P104', 3, 'POL790', 'Health', 'Cancelled', '2022-01-01', '2023-01-01'),
    ('P105', 4, 'POL791', 'Auto', 'Active', '2024-03-01', '2025-03-01'),
    ('P106', 5, 'POL792', 'Home', 'Expired', '2022-05-01', '2023-05-01'),
    ('P107', 2, 'POL793', 'Health', 'Active', '2023-10-01', '2024-10-01'),
    ('P108', 4, 'POL794', 'Life', 'Expired', '2020-01-01', '2021-01-01'),
    ('P109', 3, 'POL795', 'Auto', 'Active', '2024-04-15', '2025-04-15'),
    ('P110', 2, 'POL796', 'Home', 'Active', '2023-09-20', '2024-09-20')
    GO

-- Coverage
    CREATE TABLE Coverage (
        CoverageID VARCHAR(10) PRIMARY KEY,
        PolicyID VARCHAR(10),
        CoverageType NVARCHAR(100),
        CoverageLimit MONEY,
        Deductible MONEY,
        FOREIGN KEY (PolicyID) REFERENCES Policies(PolicyID)
    );
    GO

-- Coverage

    INSERT INTO Coverage VALUES
    ('C101', 'P101', 'Liability', 100000, 500),
    ('C102', 'P101', 'Theft', 50000, 1000),
    ('C103', 'P102', 'Property Damage', 50000, 1000),
    ('C104', 'P102', 'Natural Disaster', 75000, 1500),
    ('C105', 'P103', 'Death Benefit', 250000, 0),
    ('C106', 'P104', 'Hospitalization', 50000, 500),
    ('C107', 'P104', 'Medical', 50000, 500),
    ('C108', 'P109', 'Collision', 80000, 1300),
    ('C109', 'P105', 'Collision', 30000, 1000),
    ('C110', 'P108', 'Death Benefit', 100000, 500),
    ('C111', 'P108', 'Life Coverage', 100000, 500),
    ('C112', 'P106', 'Fire Damage', 70000, 1200),
    ('C113', 'P106', 'Theft', 70000, 1200),
    ('C114', 'P107', 'Hospitalization', 60000, 500),
    ('C115', 'P107', 'Medical', 60000, 500),
    ('C116', 'P108', 'Life Coverage', 150000, 0),
    ('C117', 'P109', 'Collision', 20000, 1000),
    ('C118', 'P110', 'Property Damage', 20000, 1000),
    ('C119', 'P110', 'Fire Damage', 20000, 1000)
    GO

-- Claims
    CREATE TABLE Claims (
        ClaimID INT PRIMARY KEY,
        PolicyID VARCHAR(10),
        ClaimNumber NVARCHAR(50),
        DateOfLoss DATE,
        Claim_Amount MONEY,
        Status NVARCHAR(20),
        FOREIGN KEY (PolicyID) REFERENCES Policies(PolicyID)
    );
    GO

-- Claims Data

    INSERT INTO Claims VALUES
    (101, 'P101', 'CLM001', '2024-06-20',20000, 'Open'),
    (102, 'P101', 'CLM002', '2024-03-10',10500, 'Closed'),
    (103, 'P104', 'CLM003', '2024-04-10',45600, 'Closed'),
    (104, 'P103', 'CLM004', '2024-06-01',12345, 'Open'),
    (105, 'P105', 'CLM005', '2023-02-18',15000, 'Closed'),
    (106, 'P106', 'CLM006', '2024-07-01',12500, 'Open'),
    (107, 'P106', 'CLM007', '2024-01-15',9000,'Closed'),
    (108, 'P109', 'CLM008', '2024-06-10',23450,'Open'),
    (109, 'P110', 'CLM009', '2024-02-18',14350,'Closed');
    GO


-- Payments
    CREATE TABLE Payments (
        PaymentID INT PRIMARY KEY,
        PolicyID VARCHAR(10),
        ClaimNumber NVARCHAR(50),
        Amount MONEY,
        PaymentDate DATE,
        Status NVARCHAR(20),
        FOREIGN KEY (PolicyID) REFERENCES Policies(PolicyID)
    );
    GO

-- Payments Data

    INSERT INTO Payments VALUES
    (101, 'P101', 'CLM001', 12000.00, '2024-01-01', 'Paid'),
    (102, 'P101', 'CLM001', 8000.00, '2024-09-25', 'OutStanding'),
    (103, 'P101', 'CLM002', 10500.00, '2023-05-15', 'Paid'),
    (104, 'P103', 'CLM004', 10000.00, '2023-02-01', 'Paid'),
    (105, 'P103', 'CLM004', 2345.00, '2024-09-25', 'Outstanding'),
    (106, 'P104', 'CLM003', 45600.00, '2022-01-01', 'Paid'),
    (107, 'P105', 'CLM005', 15000.00, '2024-03-01', 'Paid'),
    (108, 'P106', 'CLM006', 1750.00, '2022-05-01', 'Paid'),
    (109, 'P106', 'CLM006', 4000.00, '2022-10-21', 'Paid'),
    (110, 'P106', 'CLM006', 6750.00, '2024-09-25', 'Outstanding'),
    (111, 'P106', 'CLM007', 9000.00, '2023-10-01', 'Paid'),
    (112, 'P109', 'CLM008', 20000.00, '2020-01-01', 'Paid'),
    (113, 'P109', 'CLM008', 3450.00, '2024-09-25', 'OutStanding'),
    (114, 'P110', 'CLM009', 14350.00, '2023-09-20', 'Paid')
    GO


-- Agents
    CREATE TABLE Agents (
        AgentID VARCHAR(10) PRIMARY KEY,
        Name NVARCHAR(100),
        Region NVARCHAR(50)
    );
    GO

-- Agents

    INSERT INTO Agents VALUES
    ('A101', 'John Agent', 'North'),
    ('A102', 'Emma Broker', 'South'),
    ('A103', 'Sophia Patel', 'East')
    GO

-- Policy-Agent Linking Table
    CREATE TABLE PolicyAgents (
        PolicyID VARCHAR(10),
        AgentID VARCHAR(10),
        PRIMARY KEY (PolicyID, AgentID),
        FOREIGN KEY (PolicyID) REFERENCES Policies(PolicyID),
        FOREIGN KEY (AgentID) REFERENCES Agents(AgentID)
    );
    GO

-- Policy-Agent Links Data

    INSERT INTO PolicyAgents VALUES
    ('P101', 'A101'),
    ('P102', 'A102'),
    ('P103', 'A103'),
    ('P104', 'A103'),
    ('P105', 'A102'),
    ('P106', 'A102'),
    ('P107', 'A101'),
    ('P108', 'A103'),
    ('P109', 'A103'),
    ('P110', 'A101')
    GO


-- Retriving all table information.
    SELECT * FROM CUSTOMERS
    SELECT * FROM POLICIES
    SELECT * FROM CLAIMS
    SELECT * FROM COVERAGE
    SELECT * FROM PAYMENTS
    SELECT * FROM PolicyAgents
    SELECT * FROM AGENTS

-- Write Queries:
    -- Retrive Data
    -- Perform Aggregation
    -- Join Tables
    -- Use sub queries and common table expressions


-- Queries

-- Customer & Policy Queries
-- List all customers who have more than one policy.
-- Retrieve all policies that are currently active.
-- Find customers who have never made a claim.
-- Show the policy details along with the customer name.
-- List all policies that expired in the last 6 months.
-- Get the count of policies per policy type.
-- Find the average policy duration (in days).
-- Identify customers with policies having a deductible over 1000.
-- List customers who have both Auto and Home policies.
-- Show the newest policy issued for each customer.

-- Claims & Payments

-- Retrieve total claims filed per policy.
-- Find the total amount paid by each policyholder.
-- Show all claims that are still open and older than 30 days.
-- Identify policies that have claims but no payments.
-- List policies that have more than 2 claims.
-- Display total claim count and average days since loss per customer.
-- Find customers whose claims are all closed.
-- Calculate the total deductible covered under active claims.
-- List the top 5 customers by total claim count.
-- Get the earliest and latest claim dates per policy.

-- Coverage & Risk Insights

-- List coverage types with average limits and deductibles.
-- Find policies that have both liability and property damage coverage.
-- Show the maximum coverage limit per policy type.
-- Identify customers with the highest coverage limits.
-- Retrieve all policies where the deductible is more than 10% of the coverage limit.

-- Agents & Policy Management

-- List agents with the number of policies they manage.
-- Find which agent has the most active policies.
-- Show policies along with the name of the assigned agent.
-- Get total policies managed by agents in each region.
-- List agents who have never handled an expired policy.


-- Triggers / Log Maintanence

   /*  Create additional queries that involves updating, deleting, and maintaining logs of these operations in 
    the Insurance Database
    To automatically log changes in the database, you can use sql triggers in sql queries
    Triggers are special types of stored procedures that automatically execute in response
    To certain events on a table, such as INSERT, UPDATE, or DELETE.

    we'll start by adding a table to keep logs of updates and deletions. */

-- create a Log Table
-- create triggers for each table.

-- create a Log Table
CREATE TABLE LOGINFORMATION(
    LOGID INT PRIMARY KEY IDENTITY(1,1),
    TableName NVARCHAR(20),
    Operation NVARCHAR(10),
    RecordID INT,
    ChangeDate DATETIME DEFAULT GETDATE(),
    ChangedBy NVARCHAR(100)
    );

--A. Triggers for Policies Table

    /* {Inserted is used for insert and update operations,
     but when it comes for delete operaion we use deleted}
                                                         */
--Trigger for insert on policies table
CREATE or ALTER TRIGGER trg_Insert_Policies
ON Policies
AFTER INSERT
AS 
BEGIN

    -- Insert a record into the LOGINFORMATION Table
    INSERT INTO LOGINFORMATION (TableName, Operation, RecordID, ChangedBy)
    select 'Policies','INSERT', inserted.PolicyID, SYSTEM_USER
    FROM inserted
END
GO

--Trigger for update on policies table
CREATE or ALTER TRIGGER trg_Update_Policies
ON Policies
AFTER UPDATE
AS 
BEGIN

    -- Insert a record into the LOGINFORMATION Table
    INSERT INTO LOGINFORMATION (TableName, Operation, RecordID, ChangedBy)
    select 'Policies','UPDATE', inserted.PolicyID, SYSTEM_USER
    FROM inserted
END
GO
--Trigger for delete on policies table
CREATE or ALTER TRIGGER trg_Delete_Policies
ON Policies
AFTER DELETE
AS 
BEGIN

    -- Insert a record into the LOGINFORMATION Table
    INSERT INTO LOGINFORMATION (TableName, Operation, RecordID, ChangedBy)
    select 'Policies','DELETE', deleted.PolicyID, SYSTEM_USER
    FROM deleted
END
GO
    
    --B. Triggers for Claims Table
        --Trigger for insert on Claims table
        --Trigger for update on Claims table
        --Trigger for delete on Claims table       


-- Indexes
-- Views
-- Role Based Access Control(RBAC)
-- Backup & Restore