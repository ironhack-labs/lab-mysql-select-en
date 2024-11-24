Challenge 1 - Who Have Published What At Where?
In this challenge you will write a MySQL SELECT query 
that joins various tables to figure out what titles each 
author has published 
at which publishers. Your output should have at least the
following columns:

SELECT 
a.au_id AS 'AUTHOR ID', 
a.au_lname AS 'LAST NAME', 
a.au_fname AS 'FIRST NAME', 
b.title AS 'TITLE', 
p.pub_name AS 'PUBLISHER'
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id  
JOIN titles b ON ta.title_id = b.title_id  
JOIN publishers p ON b.pub_id = p.pub_id;

Challenge 2 - Who Have Published How Many At Where?
SELECT 
    a.au_id AS 'AUTHOR ID', 
    a.au_lname AS 'LAST NAME', 
    a.au_fname AS 'FIRST NAME', 
    p.pub_name AS 'PUBLISHER',
    COUNT(b.title_id) AS 'TITLE COUNT'
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles b ON ta.title_id = b.title_id
publishers p ON b.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY 'TITLE COUNT' ASC;


Challenge 3 - Best Selling Authors
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.


SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', 
SUM(b.ytd_sales) AS 'TOTAL'
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles b ON ta.title_id = b.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY 'TOTAL' DESC
LIMIT 3;


Challenge 4 - Best Selling Authors Ranking
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', 
COALESCE(SUM(b.ytd_sales), 0) AS 'TOTAL'
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles b ON ta.title_id = b.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC;