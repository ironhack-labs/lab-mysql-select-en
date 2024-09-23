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

SELECT 
    titleauthor.title_id, 
    COUNT(*) AS title_count
FROM 
    titleauthor
GROUP BY 
    titleauthor.title_id;
    
    
SELECT
    titleauthor.au_id AS AUTHOR,
    au_lname AS "LAST NAME",
    au_fname AS "FIRST NAME",
    title AS TITLE,
    pub_name AS PUBLISHER,
    COUNT(titles.title_id) AS TITLE_COUNT
FROM 
    publications.titleauthor
INNER JOIN
    authors ON titleauthor.au_id = authors.au_id
INNER JOIN
    titles ON titleauthor.title_id = titles.title_id
INNER JOIN
    publishers ON titles.pub_id = publishers.pub_id
GROUP BY
    titleauthor.au_id, au_lname, au_fname, title, pub_name
ORDER BY 
    titleauthor.au_id;

SELECT 
    titleauthor.title_id, 
    COUNT(*) AS title_count
FROM 
    titleauthor
GROUP BY 
    titleauthor.title_id;
    
SELECT
    titleauthor.au_id AS AUTHOR,
    au_lname AS "LAST NAME",
    au_fname AS "FIRST NAME",
    COUNT(sales.qty) AS total_sales
FROM 
    publications.titleauthor
INNER JOIN
    authors ON titleauthor.au_id = authors.au_id
INNER JOIN
    titles ON titleauthor.title_id = titles.title_id
INNER JOIN
    publishers ON titles.pub_id = publishers.pub_id
INNER JOIN
    sales ON titles.title_id = sales.title_id
GROUP BY
    titleauthor.au_id, au_lname, au_fname
ORDER BY 
    total_sales DESC
LIMIT 3;

SELECT
    authors.au_id AS AUTHOR,
    au_lname AS "LAST NAME",
    au_fname AS "FIRST NAME",
    COALESCE(SUM(sales.qty), 0) AS total_sales  -- Sum to get total sales and COALESCE to handle NULL
FROM 
    authors
LEFT JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN
    titles ON titleauthor.title_id = titles.title_id
LEFT JOIN
    sales ON titles.title_id = sales.title_id
GROUP BY
    authors.au_id, au_lname, au_fname
ORDER BY 
    total_sales DESC;