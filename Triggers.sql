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
CREATE or ALTER TRIGGER trg_Insert_Claims
ON Claims
AFTER INSERT
AS 
BEGIN

    -- Insert a record into the LOGINFORMATION Table
    INSERT INTO LOGINFORMATION (TableName, Operation, RecordID, ChangeBy)
    select 'Claims','INSERT', inserted.ClaimID, SYSTEM_USER
    FROM inserted
END
GO

--Trigger for update on Claims table

CREATE or ALTER TRIGGER trg_Update_Claims
ON Claims
AFTER UPDATE
AS 
BEGIN

    -- UPDATE a record into the LOGINFORMATION Table
    INSERT INTO LOGINFORMATION (TableName, Operation, RecordID, ChangeBy)
    select 'Claims','UPDATE', inserted.ClaimID, SYSTEM_USER
    FROM inserted
END
GO


--Trigger for delete on Claims table

CREATE or ALTER TRIGGER trg_delete_Claims
ON Claims
AFTER DELETE
AS 
BEGIN

    -- DELETE a record into the LOGINFORMATION Table
    INSERT INTO LOGINFORMATION (TableName, Operation, RecordID, ChangeBy)
    select 'Claims','DELETE', deleted.ClaimID, SYSTEM_USER
    FROM deleted
END
GO



--B. Triggers for Payments Table

--Trigger for insert on Payments table
CREATE or ALTER TRIGGER trg_Insert_Payments
ON Payments
AFTER INSERT
AS 
BEGIN

    -- Insert a record into the LOGINFORMATION Table
    INSERT INTO LOGINFORMATION (TableName, Operation, RecordID, ChangeBy)
    select 'Payments','INSERT', inserted.PaymentID, SYSTEM_USER
    FROM inserted
END
GO

c. --Trigger for update on Payments table

CREATE or ALTER TRIGGER trg_Update_Payments
ON Payments
AFTER UPDATE
AS 
BEGIN

    -- UPDATE a record into the LOGINFORMATION Table
    INSERT INTO LOGINFORMATION (TableName, Operation, RecordID, ChangeBy)
    select 'Payments','UPDATE', inserted.PaymentID, SYSTEM_USER
    FROM inserted
END
GO


--Trigger for delete on Claims table

CREATE or ALTER TRIGGER trg_delete_Payments
ON Payments
AFTER DELETE
AS 
BEGIN

    -- DELETE a record into the LOGINFORMATION Table
    INSERT INTO LOGINFORMATION (TableName, Operation, RecordID, ChangeBy)
    select 'Payments','DELETE', deleted.PaymentID, SYSTEM_USER
    FROM deleted
END
GO