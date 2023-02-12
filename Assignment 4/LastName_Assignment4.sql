-- Q1

-- Create bank DB
CREATE DATABASE bank_db;

-- connect to DB
\c bank_db;

-- Create tables
CREATE TABLE branch (
    branch_name varchar(40) NOT NULL,
    branch_city varchar(40) NOT NULL CHECK (branch_city IN ('Brooklyn', 'Bronx', 'Manhattan', 'Yonkers')),
    assets DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (branch_name)
);

CREATE TABLE customer (
    cust_ID INT NOT NULL,
    customer_name varchar(40) NOT NULL,
    customer_street varchar(40),
    customer_city varchar(40),
    PRIMARY KEY (cust_ID)
);

CREATE TABLE loan (
    loan_number varchar(40) NOT NULL,
    branch_name varchar(40) NOT NULL,
    amount DECIMAL(10,2) NOT NULL DEFAULT 0.0,
    PRIMARY KEY (loan_number),
    FOREIGN KEY (branch_name) REFERENCES branch (branch_name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE borrower (
    cust_ID INT NOT NULL,
    loan_number varchar(40) NOT NULL,
    PRIMARY KEY (cust_ID, loan_number),
    FOREIGN KEY (cust_ID) REFERENCES customer (cust_ID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (loan_number) REFERENCES loan (loan_number) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE account (
    account_number INT NOT NULL,
    branch_name varchar(40) NOT NULL,
    balance DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (account_number),
    FOREIGN KEY (branch_name) REFERENCES branch (branch_name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE depositor (
    cust_ID INT NOT NULL,
    account_number INT NOT NULL,
    PRIMARY KEY (cust_ID, account_number),
    FOREIGN KEY (cust_ID) REFERENCES customer (cust_ID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (account_number) REFERENCES account (account_number) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Fill data
-- Insert Values into branch --
INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('Brooklyn Bank','Brooklyn','2506789.00');

INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('First Bank of Brooklyn','Brooklyn','4738291.00');

INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('Brooklyn Bridge Bank','Brooklyn','3216549.00');

INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('Bronx Federal Credit Union','Bronx','1425365.00');

INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('Big Bronx Bank','Bronx','5632897.00');

INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('Upper East Federal Credit Union','Manhattan','9385274.00');

INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('Yonkahs Bankahs','Yonkers','2356967.00');

-- Insert Values into customer --
INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('12345', 'Billy Boi', '123 Easy Street', 'Bronx');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('54321', 'Teddy Tiger', '56 East Baltimore Road', 'Brooklyn');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('98524', 'Betty Bench', '123 Easy Street', 'Bronx');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('24357', 'Walter Halter', '67 Stupid Street', 'Brooklyn');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('73194', 'Wendy Winks', '78 Gold Street', 'Harrison');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('74185', 'Lauren Lawn', '3 Gravy Avenue', 'Yonkers');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('95124', 'Peter Pretender', '85 West Fourth Road', 'Manhattan');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('86753', 'Susan Sits', '123 Easy Street', 'Bronx');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('77776', 'Hank Handles', '2 Ford Drive', 'Harrison');

-- Insert Values into loan
INSERT INTO loan (loan_number, branch_name, amount)
VALUES ('462882645', 'Brooklyn Bridge Bank', '7500.00');

INSERT INTO loan (loan_number, branch_name, amount)
VALUES ('888512347', 'Bronx Federal Credit Union', '11500.00');

INSERT INTO loan (loan_number, branch_name, amount)
VALUES ('646469321', 'Upper East Federal Credit Union', '8550.00');

INSERT INTO loan (loan_number, branch_name, amount)
VALUES ('774485962', 'Yonkahs Bankahs', '2000.00');

INSERT INTO loan (loan_number, branch_name, amount)
VALUES ('919137375', 'Brooklyn Bank', '5000.00');

-- Insert Values into borrower
INSERT INTO borrower (cust_ID, loan_number)
VALUES ('54321','888512347');

INSERT INTO borrower (cust_ID, loan_number)
VALUES ('95124','888512347');

INSERT INTO borrower (cust_ID, loan_number)
VALUES ('24357','919137375');

INSERT INTO borrower (cust_ID, loan_number)
VALUES ('77776','462882645');

INSERT INTO borrower (cust_ID, loan_number)
VALUES ('98524','774485962');

-- Insert Values into account
INSERT INTO account (account_number, branch_name, balance)
VALUES ('142375689', 'First Bank of Brooklyn', '2003.64');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('741852963', 'Yonkahs Bankahs', '5263.23');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('159263487', 'Brooklyn Bank', '1425.98');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('963852741', 'Upper East Federal Credit Union', '2598.36');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('846275315', 'Brooklyn Bridge Bank', '688.12');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('258258963', 'Bronx Federal Credit Union', '3256.21');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('232154689', 'Big Bronx Bank', '4152.87');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('222456197', 'Bronx Federal Credit Union', '1234.56');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('774436581', 'Brooklyn Bank', '8259.34');

-- Insert Values into depositor
INSERT INTO depositor (cust_ID, account_number)
VALUES ('77776', '774436581');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('24357', '222456197');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('86753', '232154689');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('74185', '258258963');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('12345', '142375689');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('73194', '741852963');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('12345', '846275315');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('77776', '963852741');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('12345', '159263487');

	
-- Q2
SELECT depositor.cust_ID, account.branch_name, depositor.account_number, account.balance
FROM depositor
INNER JOIN account
ON depositor.account_number = account.account_number;


-- Q3
SELECT borrower.cust_ID, borrower.loan_number, depositor.account_number
FROM borrower
INNER JOIN depositor
ON borrower.cust_ID = depositor.cust_ID;


-- Q4
SELECT customer.customer_city, branch.branch_city, branch.branch_name, depositor.account_number
FROM depositor
INNER JOIN customer
ON depositor.cust_ID = customer.cust_ID
INNER JOIN branch
ON branch_name = branch.branch_name
WHERE customer.customer_city = branch.branch_city;


-- Q5
WITH depositor_cust_ID AS (
    SELECT DISTINCT cust_ID
    FROM depositor
), borrower_cust_ID AS (
    SELECT DISTINCT cust_ID
    FROM borrower
)
SELECT depositor_cust_ID.cust_ID
FROM depositor_cust_ID
WHERE cust_ID IN (
    SELECT cust_ID
    FROM borrower_cust_ID
);



-- Q6
SELECT students.ID
FROM students
LEFT JOIN enrollment
ON students.ID = enrollment.student_ID
WHERE enrollment.student_ID IS NULL;


