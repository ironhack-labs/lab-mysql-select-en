#Challenge 1
SELECT 
    authors.au_id AS 'Author ID',
    authors.au_lname AS 'Last Name',
    authors.au_fname AS 'First Name',
    titles.title AS 'Title',
    publishers.pub_name AS 'Publisher'
FROM 
    publications.authors
JOIN 
    publications.titleauthor ON authors.au_id = titleauthor.au_id
JOIN 
    publications.titles ON titleauthor.title_id = titles.title_id
JOIN 
    publishers ON titles.pub_id = publishers.pub_id
ORDER BY 
    authors.au_id, titles.title;

#Challenge 2
SELECT 
    authors.au_id AS 'Author ID',
    authors.au_lname AS 'Last Name',
    authors.au_fname AS 'First Name',
    publishers.pub_name AS 'Publisher',
    COUNT(titles.title_id) AS 'Title Count'
FROM 
    publications.authors
JOIN 
    publications.titleauthor ON authors.au_id = titleauthor.au_id
JOIN 
    publications.titles ON titleauthor.title_id = titles.title_id
JOIN 
    publications.publishers ON titles.pub_id = publishers.pub_id
GROUP BY 
    authors.au_id, publishers.pub_name
ORDER BY 
    authors.au_id, publishers.pub_name;

#Challenge 3
SELECT 
    authors.au_id AS 'Author ID',
    authors.au_lname AS 'Last Name',
    authors.au_fname AS 'First Name',
    SUM(sales.qty) AS 'Total'
FROM 
    publications.authors
JOIN 
    publications.titleauthor ON authors.au_id = titleauthor.au_id
JOIN 
    publications.sales ON titleauthor.title_id = sales.title_id
GROUP BY 
    authors.au_id
ORDER BY 
    SUM(sales.qty) DESC
LIMIT 3;

#Challenge 4
SELECT 
    authors.au_id AS 'Author ID',
    authors.au_lname AS 'Last Name',
    authors.au_fname AS 'First Name',
    COALESCE(SUM(sales.qty), 0) AS 'Total'
FROM 
    publications.authors
LEFT JOIN 
	publications.titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN 
	publications.sales ON titleauthor.title_id = sales.title_id
GROUP BY 
    authors.au_id
ORDER BY 
    COALESCE(SUM(sales.qty), 0) DESC;
