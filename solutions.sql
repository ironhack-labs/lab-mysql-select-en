USE publications;
SHOW tables;


--  In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each 
--- author has published at which publishers.
SELECT 
    a.au_id AS `AUTHOR ID`,
    a.au_lname AS `LAST NAME`,
    a.au_fname AS `FIRST NAME`,
    t.title AS `TITLE`,
    p.pub_name AS `PUBLISHER`
FROM 
    titleauthor ta
JOIN 
    authors a ON ta.au_id = a.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers p ON t.pub_id = p.pub_id;

--
-- Checking to see if I have the correct number of columns.
SELECT COUNT(*) FROM titleauthor;
---
-- Challenge 2 - Who Have Published How Many At Where?
--- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.

SELECT 
    a.au_id AS `AUTHOR ID`,
    a.au_lname AS `LAST NAME`,
    a.au_fname AS `FIRST NAME`,
    p.pub_name AS `PUBLISHER`,
    COUNT(t.title_id) AS `TITLE COUNT`
FROM 
    titleauthor ta
JOIN 
    authors a ON ta.au_id = a.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers p ON t.pub_id = p.pub_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY 
    a.au_id, p.pub_name;

--
-- Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles?
SELECT 
    a.au_id AS `AUTHOR ID`,
    a.au_lname AS `LAST NAME`,
    a.au_fname AS `FIRST NAME`,
    SUM(s.qty) AS `TOTAL`
FROM 
    titleauthor ta
JOIN 
    authors a ON ta.au_id = a.au_id
JOIN 
    sales s ON ta.title_id = s.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    `TOTAL` DESC
LIMIT 3;

--
-- Challenge 4 - Best Selling Authors Ranking
-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
-- Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL).
--  Also order your results based on TOTAL from high to low.
SELECT 
    a.au_id AS `AUTHOR ID`,
    a.au_lname AS `LAST NAME`,
    a.au_fname AS `FIRST NAME`,
    COALESCE(SUM(s.qty), 0) AS `TOTAL`
FROM 
    authors a
LEFT JOIN 
    titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN 
    sales s ON ta.title_id = s.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    `TOTAL` DESC;
