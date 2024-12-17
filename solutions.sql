/*Query 1
Get the id values of the first 5 clients from district_id with a value equals to 1.*/
USE bank;

SELECT client_id
FROM client
WHERE district_id = 1
ORDER BY client_id ASC
LIMIT 5;

/*Query 2	
In the client table, get an id value of the last client where the district_id equals to 72.*/
USE bank;	

SELECT MAX(client_id)
FROM client
WHERE district_id = 72;

/*Query 3
Get the 3 lowest amounts in the loan table.*/
USE bank;

SELECT amount
FROM loan
ORDER BY amount ASC
LIMIT 3;

/*Query 4
Possible values for status, ordered alphabetically in ascending order in the loan table.*/
USE bank;

SELECT DISTINCT status
FROM loan
ORDER BY status ASC;

/*Query 5
What is the loan_id of the highest payment received in the loan table?*/
USE bank;

SELECT loan_id
FROM loan
ORDER BY payments DESC
LIMIT 1;

/*Query 6
Find the loan amount of the lowest 5 account)_ids in the loan table.
Show the account_id and the corresponding amount.*/
USE bank;

SELECT account_id, amount
FROM loan
ORDER BY account_id ASC
LIMIT 5;

/*Query 7
Find the account_ids with the lowest loan amount that have a loan duration of 60 in the loan table.*/
USE bank;
SELECT account_id 
FROM loan
WHERE duration = 60
ORDER by amount ASC
LIMIT 5;

/*Query 8
Find the unique values of k_symbol in the order table.*/
USE bank;

SELECT DISTINCT `k_symbol`
FROM `order`
ORDER BY `k_symbol` ASC;

/*Query 9
Find the ids of the client with the account_id=34 (in the order table).*/
USE bank;

SELECT `order_id`
FROM `order`
WHERE account_id = 34;

/*Query 10
Find the account_ids responsible for orders between order_id 29540 and 29560, inclusive (order table).*/
USE bank;

SELECT `account_id`
FROM `orders`
WHERE `order_id` >= 29540 and `order_id` <= 29560

/*Query 11
In the order table, find the individual amounts that were sent to account_to id 30067122.*/
USE bank;

SELECT `amount`
FROM `order`
WHERE `account_to` = 30067122;

/*Query 12
In the trans table, show the trans_id, date, type, and amount of the 10 
first transactions from account_id 793 in chronological order, from newest to oldest.*/
USE bank;

SELECT trans_id, date, type, amount
FROM trans
ORDER BY DATE ASC;

/*Query 13
Select all districts with district_id < 10 from the client table. Order by district_id in ascending order.*/
Use bank;

SELECT district_id, COUNT(*) AS record_count
FROM client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id ASC;

/*Query 14
How many cards exist for each type in the card table. Rank by most frequent type*/
USE bank;

SELECT type, COUNT(*) AS record_count
FROM card
GROUP BY type
ORDER BY record_count DESC;

/*Query 15
Using the loan table, print the top 10 account_id based on the sum of all their loan amounts.*/
USE bank;

SELECT account_id, SUM(amount)
FROM loan
GROUP BY account_id
ORDER BY SUM(amount) DESC
LIMIT 10;

/*Query 16
In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, 
ordered by date in descending order.*/
Use banks;

SELECT date, COUNT(*) AS record_count
FROM loan
WHERE date < '930907'
GROUP BY date
ORDER BY date DESC;

/*Query 17
In the loan table, for each day in December 1997, count the number of loans issued for each 
unique loan duration, ordered by date and duration, both in ascending order. You can ignore 
days without any loans in your output.*/
USE bank;

SELECT `date`, `duration`, COUNT(`loan_id`) AS `loan_count`
FROM `loan`
WHERE `date` BETWEEN '1997-12-01' AND '1997-12-31'
GROUP BY `date`, `duration`
ORDER BY `date` ASC, `duration` ASC;

/*Query 18
In the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ 
= Outgoing, PRIJEM = Incoming). Your output should have the account_id, the type and the sum 
of amount, named as total_amount. Sort alphabetically by type.*/
USE bank;

SELECT account_id, type, SUM(amount) AS total_amount
FROM trans
WHERE account_id = 396
GROUP BY account_id, type
ORDER BY type ASC;
