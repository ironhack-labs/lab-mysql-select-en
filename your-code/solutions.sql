
-- CHALLENGE 1
-- Who Have Published What At Where?

SELECT ta.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`,
au_fname AS `FIRST NAME`, title AS TITLE, pub_name AS PUBLISHER
FROM titleauthor ta
LEFT JOIN authors a ON ta.au_id = a.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
LEFT JOIN publishers p ON t.pub_id = p.pub_id
ORDER BY ta.au_id, title DESC;

-- CHALLENGE 2
-- Who Have Published How Many At Where?

SELECT ta.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`,
au_fname AS `FIRST NAME`, pub_name AS PUBLISHER, COUNT(title) AS `TITLE COUNT`
FROM titleauthor ta
LEFT JOIN authors a ON ta.au_id = a.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
LEFT JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY ta.au_id, pub_name
ORDER BY ta.au_id DESC, pub_name DESC;

-- CHALLENGE 3
-- Best Selling Authors

SELECT ta.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`,
au_fname AS `FIRST NAME`, SUM(qty) AS TOTAL
FROM titleauthor ta
LEFT JOIN authors a ON ta.au_id = a.au_id
LEFT JOIN sales s ON ta.title_id = s.title_id
GROUP BY ta.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- CHALLENGE 4
-- Best Selling Authors Ranking
SELECT a.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`,
au_fname AS `FIRST NAME`, IFNULL(SUM(qty), 0) AS TOTAL
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN sales s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;
