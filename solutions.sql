-- Challenge 1 - Who Have Published What At Where?
-- In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:
-- SELECT a.au_id AS AUTHOR ID, a.au_lname AS LAST NAME, a.au_fname AS FIRST NAME, t.title_name AS TITLE, p.publisher_name AS PUBLISHER
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', t.title AS 'TITLE', p.pub_name AS 'PUBLISHER'
FROM authors a
JOIN titleauthor at ON a.au_id = at.au_id
JOIN titles t ON at.title_id = t.title_id
JOIN publishers p ON p.pub_id = t.pub_id
ORDER BY  a.au_id;

-- Challenge 2 - Who Have Published How Many At Where?
-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', p.pub_name AS 'PUBLISHER',COUNT(t.title_id) AS 'TITLE COUNT'
FROM authors a
JOIN titleauthor at ON a.au_id = at.au_id
JOIN titles t ON at.title_id = t.title_id
JOIN publishers p ON p.pub_id = t.pub_id
GROUP BY a.au_fname, p.pub_name
ORDER BY COUNT(t.title_id) DESC;

-- Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', COUNT(t.title_id) AS 'TOTAL'
FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
GROUP BY a.au_id
ORDER BY COUNT(t.title_id) DESC;
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME',COUNT(t.title_id) AS 'TOTAL'
FROM authors a
LEFT JOIN titleauthor ta on ta.au_id = a.au_id 
LEFT JOIN titles t ON ta.title_id = t.title_id 
GROUP BY a.au_id
ORDER BY COUNT(t.title_id) DESC;

