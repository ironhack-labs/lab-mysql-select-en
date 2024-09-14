-- Solutions to SQL Labs2
-- Solution to Challenge 1

SELECT authors.au_id AS 'AUTHOR ID', 
authors.au_lname AS 'LAST NAME', 
authors.au_fname AS 'FIRST NAME', 
titles.title AS 'TITLE', 
publishers.pub_name AS 'PUBLISHER'
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id;

-- Solution to Challenge 2

SELECT 
authors.au_id as 'AUTHOR ID',
authors.au_lname as 'LAST NAME',
authors.au_fname as 'FIRST NAME', 
titles.title as 'TITLE',
publishers.pub_name as 'PUBLISHER',
COUNT(titles.title) as 'TITLE COUNT'
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY
authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name

-- Solution to Challenge 3

SELECT 
authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
SUM (sales.qty)  AS 'TOTAL'
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY 
authors.au_id, authors.au_lname, authors.au_fname
ORDER BY 
TOTAL DESC
LIMIT 3;

-- Solution to Challenge 4

SELECT 
authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
IFNULL(SUM(sales.qty), 0) AS 'TOTAL'
FROM 
authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY 
authors.au_id, authors.au_lname, authors.au_fname
ORDER BY 
TOTAL DESC;


