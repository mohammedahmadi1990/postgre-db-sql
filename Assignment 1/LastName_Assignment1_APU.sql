-- create DB
CREATE DATABASE auto_parts_unlimited;

-- connect to DB
\c auto_parts_unlimited;

-- Customers table
CREATE TABLE customers (
  id serial primary key,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  phone varchar(20) UNIQUE NOT NULL,
  email varchar(100) UNIQUE NOT NULL,
  street_address varchar(100),
  zip varchar(5),
  state varchar(2)
);

-- Employees table
CREATE TABLE employees (
  id serial primary key,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  phone varchar(20) UNIQUE NOT NULL,
  email varchar(100) UNIQUE NOT NULL,
  street_address varchar(100) ,
  zip varchar(5),
  state varchar(2),
  hire_date date,
  salary decimal(10, 2),
  probationary_status boolean
);

-- Parts Inventories table
CREATE TABLE parts_inventory (
  part_number serial primary key,
  manufacturer varchar(100),
  quantity integer NOT NULL,
  price decimal(10, 2),
  backordered_status boolean
);	