-- Firstname Lastname
-- AirBNB Open DATA
-- AirBNB is a famous successful company which has gigantic dataset that can be good experience to work with rental data.


-- Create DB
CREATE DATABASE airbnb_open_db;

-- connect to DB
\c airbnb_open_db;

-- Create Airbnb_Open_Data rable
CREATE TABLE airbnb_open_data (
  id INT,
  NAME TEXT,
  host_id BIGINT,
  host_identity_verified VARCHAR(20),
  host_name VARCHAR(40),
  neighbourhood_group VARCHAR(40),
  neighbourhood VARCHAR(40),
  lat NUMERIC(10,6),
  long NUMERIC(10,6),
  country VARCHAR(40),
  country_code VARCHAR(10),
  instant_bookable BOOLEAN,
  cancellation_policy VARCHAR(20),
  room_type VARCHAR(50),
  construction_year INT,
  price TEXT,
  service_fee TEXT,
  minimum_nights INT,
  number_of_reviews INT,
  last_review DATE,
  reviews_per_month DECIMAL(10,2),
  review_rate_number INT,
  calculated_host_listings_count INT,
  availability_365 INT,
  house_rules TEXT,
  license TEXT
);

-- Copy data from the CSV file
COPY airbnb_open_data FROM 'd:\Airbnb_Open_Data.csv' WITH (FORMAT csv, HEADER true);

-- Verify data copied: 102599 records
SELECT * FROM airbnb_open_data;


-- Q1
CREATE TABLE airbnb_open_data_backup AS
SELECT *
FROM airbnb_open_data;

-- Q2
ALTER TABLE airbnb_open_data
ADD COLUMN duplicate INT;


-- Q3 - c
-- Here, as this field is iportant for us, we delte the data record if we encounter NULL value.
-- It shoud be notted that all the empty contents have updated to NULL using Postgresql.
DELETE FROM airbnb_open_data
WHERE NAME IS NULL;


-- Q4
-- In this column we put zero for those without any value.
UPDATE airbnb_open_data
SET reviews_per_month = 0
WHERE reviews_per_month IS NULL;


-- Q5
-- Here we correct incorrectly written neighbourhood groups
UPDATE airbnb_open_data
SET neighbourhood_group = 'Brooklyn'
WHERE neighbourhood_group = 'brookln';



-- Q6
-- For this column we have updated all the neighbourhoods which contains both of 
-- the values
UPDATE airbnb_open_data
SET neighbourhood = 'Jamaica'
WHERE neighbourhood = 'Jamaica Estates' OR neighbourhood = 'Jamaica Hills';



-- Q7
-- Using this method we delete an empty column to clean database.
ALTER TABLE airbnb_open_data
DROP COLUMN license;



