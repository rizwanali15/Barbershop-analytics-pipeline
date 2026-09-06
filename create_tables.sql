-- CREATE DATABASE BarbershopAnalytics
-- GO

USE BarbershopAnalytics;
GO

-- Create Schemas

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE [name] = 'bronze')
BEGIN
	EXEC('CREATE SCHEMA bronze')
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE [name] = 'staging')
BEGIN
	EXEC('CREATE SCHEMA staging')
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE [name] = 'dw')
BEGIN
	EXEC('CREATE SCHEMA dw')
END;
GO


-- Create Tables

IF OBJECT_ID('bronze.customers_raw', 'U') IS NOT NULL 
    DROP TABLE bronze.customers_raw;
GO

CREATE TABLE bronze.customers_raw (
    customer_code VARCHAR(20),
    customer_name VARCHAR(200),
    phone VARCHAR(50),
    join_date VARCHAR(50),
    source_file_name VARCHAR(200),
    loaded_at DATETIME2 DEFAULT GETDATE()
);
GO


IF OBJECT_ID('bronze.payments_raw', 'U') IS NOT NULL 
    DROP TABLE bronze.payments_raw;
GO

CREATE TABLE bronze.payments_raw (
    payment_id VARCHAR(20),
    booking_id VARCHAR(20),
    amount VARCHAR(50),
    payment_method VARCHAR(50),
    source_file_name VARCHAR(200),
    loaded_at DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('bronze.bookings_raw', 'U') IS NOT NULL 
    DROP TABLE bronze.bookings_raw;
GO

CREATE TABLE bronze.bookings_raw (
    booking_id VARCHAR(20),
    customer_code VARCHAR(20),
    barber_code VARCHAR(20),
    branch_code VARCHAR(20),
    service_code VARCHAR(20),
    booking_date VARCHAR(50),
    status VARCHAR(50),
    source_file_name VARCHAR(200),
    loaded_at DATETIME2 DEFAULT GETDATE()
);
GO


IF OBJECT_ID('bronze.branches_raw', 'U') IS NOT NULL 
    DROP TABLE bronze.branches_raw;
GO

CREATE TABLE bronze.branches_raw (
    branch_code VARCHAR(20),
    branch_name VARCHAR(200),
    city VARCHAR(50),
    opening_date VARCHAR(50),
    source_file_name VARCHAR(200),
    loaded_at DATETIME2 DEFAULT GETDATE()
);
GO


IF OBJECT_ID('bronze.barbers_raw', 'U') IS NOT NULL 
    DROP TABLE bronze.barbers_raw;
GO

CREATE TABLE bronze.barbers_raw (
    barber_code VARCHAR(20),
    barber_name VARCHAR(200),
    branch_code VARCHAR(20),
    experience_level VARCHAR(50),
    hire_date VARCHAR(50),
    source_file_name VARCHAR(200),
    loaded_at DATETIME2 DEFAULT GETDATE()
);
GO


IF OBJECT_ID('bronze.services_raw', 'U') IS NOT NULL 
    DROP TABLE bronze.services_raw;
GO

CREATE TABLE bronze.services_raw (
    service_code VARCHAR(20),
    service_name VARCHAR(200),
    price VARCHAR(50),
    duration_min VARCHAR(50),
    source_file_name VARCHAR(200),
    loaded_at DATETIME2 DEFAULT GETDATE()
);
GO
