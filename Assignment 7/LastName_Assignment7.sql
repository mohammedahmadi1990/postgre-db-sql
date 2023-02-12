
-- Q1
SELECT cust_ID, customer_name
FROM customer
WHERE
  cust_ID IN (SELECT cust_ID FROM borrower) AND
  cust_ID NOT IN (SELECT cust_ID FROM depositor);


-- Q2
SELECT cust_ID, customer_name
FROM customer
WHERE (customer_street, customer_city) = 
  (SELECT customer_street, customer_city
   FROM customer
   WHERE cust_ID = 12345)
OR cust_ID = 12345;



-- Q3
SELECT branch_name AS Branch
FROM branch
WHERE branch_name IN 
   (SELECT branch_name
    FROM account
    WHERE account_number IN 
      (SELECT account_number
       FROM depositor
       WHERE cust_ID IN 
	      (SELECT cust_ID
           FROM customer
           WHERE customer_city = 'Harrison')));



-- Q4
SELECT cust_ID, customer_name
FROM customer
WHERE NOT EXISTS 
   (SELECT branch_name
    FROM branch
    WHERE branch_city = 'Brooklyn'
    AND branch_name NOT IN 
	   (SELECT branch_name
        FROM account
        WHERE account_number IN 
		   (SELECT account_number
            FROM depositor
            WHERE cust_ID = customer.cust_ID)));



-- Q5
SELECT cust_ID, customer_city, branch_city, account_number
FROM (
    SELECT depositor.cust_ID, customer.customer_city, branch.branch_city, depositor.account_number
    FROM depositor, customer, account, branch
    WHERE depositor.cust_ID = customer.cust_ID
    AND depositor.account_number = account.account_number
    AND account.branch_name = branch.branch_name
) AS customers_and_accounts
WHERE customer_city = branch_city;



-- Q6
SELECT customer_name, branch_name
FROM customer, branch
WHERE cust_ID IN 
   (SELECT cust_ID
    FROM borrower
    WHERE loan_number IN 
	   (SELECT loan_number
        FROM loan
        WHERE branch_name = 'Yonkahs Bankahs'));




-- Q7
SELECT customer_name, loan_number
FROM customer,loan
WHERE cust_ID IN 
   (SELECT cust_ID
    FROM borrower
    WHERE loan_number IN 
	   (SELECT loan_number
        FROM loan
        WHERE amount > 5000));



