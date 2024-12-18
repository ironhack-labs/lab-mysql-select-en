
-- Challenge #1
SELECT*
from publications.titleauthor;

SELECT 
	titleauthor.au_id as AUTHOR,
    au_lname as "LAST NAME",
    au_fname as "FIRST NAME",
    title as TITLE,
    pub_name as PUBLISHER
FROM publications.titleauthor
INNER JOIN
	authors on titleauthor.au_id = authors.au_id
INNER JOIN
	titles on titleauthor.title_id = titles.title_id
INNER JOIN
	publishers on titles.pub_id = publishers.pub_id
ORDER BY titleauthor.au_id;

-- Challenge #2
SELECT 
	titleauthor.au_id as AUTHOR,
    au_lname as "LAST NAME",
    au_fname as "FIRST NAME",
    pub_name as PUBLISHER,
    count(titles.title_id) AS "TITLE COUNT"
FROM publications.titleauthor
INNER JOIN
	authors on titleauthor.au_id = authors.au_id
INNER JOIN
	titles on titleauthor.title_id = titles.title_id
INNER JOIN
	publishers on titles.pub_id = publishers.pub_id
GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname, pub_name
ORDER BY titleauthor.au_id DESC;


-- Challenge #3
SELECT
	titleauthor.au_id as "AUTHOR ID",
    au_lname as "LAST NAME",
    au_fname as "FIRST NAME",
	count(sales.qty) as "TOTAL"
   FROM publications.titleauthor
	INNER JOIN
		authors on titleauthor.au_id = authors.au_id
	INNER JOIN
		titles on titleauthor.title_id = titles.title_id
	INNER JOIN
		publishers on titles.pub_id = publishers.pub_id
	INNER JOIN
		sales on titles.title_id = sales.title_id
	GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname
ORDER BY count(sales.qty) DESC
LIMIT 3;
-- Challenge #4
SELECT
    titleauthor.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    COUNT(sales.qty) AS "TOTAL"
FROM 
    publications.titleauthor
LEFT JOIN
    authors ON titleauthor.au_id = authors.au_id
LEFT JOIN
    titles ON titleauthor.title_id = titles.title_id
LEFT JOIN
    publishers ON titles.pub_id = publishers.pub_id
LEFT JOIN
    sales ON titles.title_id = sales.title_id
GROUP BY 
    titleauthor.au_id, authors.au_lname, authors.au_fname
ORDER BY 
    COUNT(sales.qty) DESC;
    
    