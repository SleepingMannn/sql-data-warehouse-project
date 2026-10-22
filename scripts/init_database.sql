/*
=============================================================
Database and Schemas Setup
=============================================================
Script Purpose:
    Creates a fresh 'DataWarehouse' database. If a database with this name
    already exists, it is dropped and rebuilt from scratch. After that, the
    script creates three schemas inside it: 'bronze', 'silver' and 'gold',
    which represent the layers of the data warehouse.

WARNING:
    This script permanently deletes the existing 'DataWarehouse' database
    together with all of its data. Use it only in a development or learning
    environment, and make a backup first if you need to keep anything.
*/

USE master;
GO

-- Drop and rebuilt the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
