-- Query #1 Challenge 1 - 
-- Challenge 1 - Who Have Published What At Where?

SELECT 
    a.au_id AS 'Author ID',
    a.au_lname AS 'Last Name', 
    a.au_fname AS 'First Name', 
    t.title AS 'Title', 
    p.pub_name AS 'Publisher'
FROM 
    pubs.authors a
JOIN 
    pubs.titleauthor ta ON a.au_id = ta.au_id
JOIN 
    pubs.titles t ON ta.title_id = t.title_id
JOIN 
    pubs.publishers p ON t.pub_id = p.pub_id;

-- Query #2 Challenge 2 - Who Have Published How Many At Where?
-- Challenge 2 - Who Have Published How Many At Where?

SELECT 
    a.au_id AS 'Author ID',
    a.au_lname AS 'Last Name', 
    a.au_fname AS 'First Name', 
    p.pub_name AS 'Publisher',
    COUNT(t.title) AS 'Title Count'
FROM 
    pubs.authors a
JOIN 
    pubs.titleauthor ta ON a.au_id = ta.au_id
JOIN 
    pubs.titles t ON ta.title_id = t.title_id
JOIN 
    pubs.publishers p ON t.pub_id = p.pub_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname, p.pub_name;

-- Query 3:
-- Challenge 3 - Best Selling Authors

SELECT 
    a.au_id AS 'Author ID',
    a.au_lname AS 'Last Name', 
    a.au_fname AS 'First Name', 
    COUNT(ta.title_id) AS 'Total'
FROM 
    pubs.authors a
JOIN
    pubs.titleauthor ta ON a.au_id = ta.au_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY
	Total DESC
LIMIT 3;

-- Query 4:
-- Challenge 4 - Best Selling Authors Ranking

SELECT 
    a.au_id AS 'Author ID',
    a.au_lname AS 'Last Name', 
    a.au_fname AS 'First Name', 
    COUNT(ta.title_id) AS 'Total'
FROM 
    pubs.authors a
JOIN
    pubs.titleauthor ta ON a.au_id = ta.au_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY
	Total DESC;