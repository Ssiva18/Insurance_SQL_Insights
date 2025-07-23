--Defining Indexes i.e., Clustered, NON-Clustered and Unique Index over different table

    /* Things to be remembered i.e., we can only have one custered index and multiple non clustered indexes 
    with in the table.*/


    --Demo Example 
        /* create a table with name pisto and mention  couple of columns where ID column is a PK */

    create table pisto(id int primary key, value int)
    insert into pisto values (1,12),(2,24)
    select * from pisto 

    --Create clustered index.
      /*    So by default the PK constraint will be considered as clustered index and the moment when we try to
            execute below code this just throws the error, Because the table will accept only one clustered index.
            In order to assign cluster index to ID column, do drop the PK constraint and add index, after adding the index, 
            Re-assign the Key constraint to the column  
            
      */

    create clustered index CLS_IDX_ps on pisto(ID)
    ALTER TABLE pisto drop constraint PK__pisto__3213E83F5712776E
    ALTER TABLE pisto ADD CONSTRAINT PK_Person PRIMARY KEY (ID);