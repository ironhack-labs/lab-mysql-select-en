-- Challenge 1
SELECT 
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	titles.title AS "TITLE",
	publishers.pub_name AS "PUBLISHER"
FROM authors
INNER JOIN publishers, titles, titleauthor
ON
	publishers.pub_id = titles.pub_id AND
	titles.title_id = titleauthor.title_id AND
	titleauthor.au_id = authors.au_id
ORDER BY
	"AUTHOR ID" ASC, "TITLE" DESC;
	
-- Challenge 2
SELECT 
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	publishers.pub_name AS "PUBLISHER",
	COUNT(titles.title_id) as "TITLE COUNT"
FROM authors
INNER JOIN publishers, titles, titleauthor
ON
	publishers.pub_id = titles.pub_id AND
	titles.title_id = titleauthor.title_id AND
	titleauthor.au_id = authors.au_id
GROUP BY
	"AUTHOR ID", "PUBLISHER"
ORDER BY
	"AUTHOR ID" DESC;
	
-- Challenge 3
SELECT 
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	sum(sales.qty) as "TOTAL"
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY
	"AUTHOR ID"
ORDER BY
	"TOTAL" DESC
LIMIT 3;

-- Challenge 4
SELECT 
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	CASE 
        WHEN SUM(sales.qty) IS NULL THEN 0
        ELSE SUM(sales.qty) END AS "TOTAL"
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY
	"AUTHOR ID"
ORDER BY
	"TOTAL" DESC;