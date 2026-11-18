/*
===============================================================================
Script:   init_database.sql
Purpose:  Creates the 'DataWarehouse' database and its three schemas:
          bronze, silver and gold.

          If a database named 'DataWarehouse' already exists, it is dropped
          and recreated, so the script can be re-run to return to a clean,
          empty state.

Layers:   bronze - raw data loaded as-is from the CRM and ERP source files
          silver - cleaned and standardized data
          gold   - business-ready views modeled as a star schema

WARNING:  Running this script permanently deletes the existing
          'DataWarehouse' database and everything in it. Any open
          connections are closed and their transactions rolled back.
          Check that you have a backup before running it on a server
          that holds anything you need.
===============================================================================
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database

if EXISTS (select 1 from sys.databases where name = 'DataWarehouse')
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

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
