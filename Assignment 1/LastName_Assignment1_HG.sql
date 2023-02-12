-- create DB
CREATE DATABASE holy_grounds;

-- connect to DB
\c holy_grounds;

-- Coffee Inventory table
CREATE TABLE coffee_inventory (
  sku serial primary key,
  name varchar(100) NOT NULL,
  roast_type varchar(10) NOT NULL CHECK (roast_type IN ('dark', 'medium', 'light')),
  pounds_on_hand decimal(10, 2) NOT NULL,
  organic boolean NOT NULL,
  low_acid boolean NOT NULL,
  price_per_lb decimal(10, 2)
);

-- Sales Transaction table
CREATE TABLE sales_transaction (
  receipt_id bigint primary key,
  sale_amount decimal(10, 2) NOT NULL,
  sale_type varchar(10) NOT NULL CHECK (sale_type IN ('online', 'in-store')),
  transaction_date date NOT NULL
);

-- Store table
CREATE TABLE store (
  store_id serial primary key,
  store_manager varchar(100),
  store_phone varchar(20),
  street_address varchar(200) NOT NULL,
  city varchar(100) NOT NULL,
  zip varchar(5),
  state varchar(2) NOT NULL
);