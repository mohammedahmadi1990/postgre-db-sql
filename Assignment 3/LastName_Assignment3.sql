-- Q1
-- Create DB
CREATE DATABASE bitcoin_db;
-- connect to DB
\c bitcoin_db;
-- Create bitcoin_data
CREATE TABLE bitcoin_data (
    trans_date DATE,
    priceusd DECIMAL(10,5),
    code_size INT,
    sentbyaddress INT,
    transactions INT,
    mining_profitability DECIMAL(10,5),
    sentinusd BIGINT,
    transactionfees DECIMAL(10,5),
    median_transaction_fee DECIMAL(10,5),
    confirmationtime DECIMAL(10,5),
    marketcap BIGINT,
    transactionvalue INT,
    mediantransactionvalue DECIMAL(10,5),
    tweets INT,
    google_trends DECIMAL(10,5),
    fee_to_reward DECIMAL(10,5),
    activeaddresses INT,
    top100cap DECIMAL(10,5)
);


-- Q2
-- Copy data from the CSV file
COPY bitcoin_data FROM 'd:\bitcoin_data.csv' WITH (FORMAT csv, HEADER true);
-- Verify data copied: 3180 records
SELECT * FROM bitcoin_data;


-- Q3
SELECT * 
FROM bitcoin_data;

-- Q4
SELECT trans_date, code_size / transactions AS difficulty
FROM bitcoin_data;


-- Q5
SELECT trans_date, median_transaction_fee * transactions AS daily_cost
FROM bitcoin_data;


-- Q6
SELECT trans_date, sentinusd / transactions AS average_transaction, mediantransactionvalue
FROM bitcoin_data;


-- Q7
SELECT AVG(priceusd) AS avg_price
FROM bitcoin_data;


-- Q8
SELECT SUM(transactions) AS total_transactions
FROM bitcoin_data;


-- Q9
SELECT MAX(marketcap) AS max_cap
FROM bitcoin_data;


-- Q10
SELECT AVG(tweets) AS avg_daily_tweets
FROM bitcoin_data;


