-- Challenge 1

SELECT 
	authors.au_id AS "AUTHOR ID", 
	authors.au_lname AS "LAST NAME", 
	authors.au_fname AS "FIRST NAME", 
	titles.title AS "TITLE",
	publishers.pub_name AS "PUBLISHER"

FROM authors

INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;

-- Challenge 2

SELECT 
	authors.au_id AS "AUTHOR ID", 
	authors.au_lname AS "LAST NAME", 
	authors.au_fname AS "FIRST NAME", 
	publishers.pub_name AS "PUBLISHER",
	COUNT(titleauthor.title_id) AS "TITLE COUNT"

FROM authors

INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id

GROUP BY authors.au_lname;

-- Challenge 3

SELECT 
	authors.au_id AS "AUTHOR ID", 
	authors.au_lname AS "LAST NAME", 
	authors.au_fname AS "FIRST NAME", 
	SUM(sales.qty) AS "TOTAL"

FROM authors

INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN sales ON titles.title_id = sales.title_id

GROUP BY authors.au_lname
ORDER BY 	SUM(sales.qty) DESC
LIMIT 3;

-- Challenge 4

SELECT 
	authors.au_id AS "AUTHOR ID", 
	authors.au_lname AS "LAST NAME", 
	authors.au_fname AS "FIRST NAME", 
	COALESCE(SUM(sales.qty), 0) AS "TOTAL"

FROM authors

INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN sales ON titles.title_id = sales.title_id

GROUP BY authors.au_lname
ORDER BY SUM(sales.qty) DESC;