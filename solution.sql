-- Cha1SQL1
-- Query for Who Have Published What At Where
SELECT 
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    titles.title AS "TITLE",
    publishers.pub_name AS "PUBLISHER"
FROM 
    titleauthor
JOIN 
    authors ON titleauthor.au_id = authors.au_id
JOIN 
    titles ON titleauthor.title_id = titles.title_id
JOIN 
    publishers ON titles.pub_id = publishers.pub_id;

-- Cha2SQL2
-- Query for Who Have Published How Many At Where
SELECT 
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    publishers.pub_name AS "PUBLISHER",
    COUNT(titles.title_id) AS "TITLE COUNT"
FROM 
    titleauthor
JOIN 
    authors ON titleauthor.au_id = authors.au_id
JOIN 
    titles ON titleauthor.title_id = titles.title_id
JOIN 
    publishers ON titles.pub_id = publishers.pub_id
GROUP BY 
    authors.au_id, publishers.pub_id;

-- Cha3SQL3
-- Query for Best Selling Authors (Top 3)
SELECT 
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    SUM(titles.ytd_sales) AS "TOTAL"
FROM 
    titleauthor
JOIN 
    authors ON titleauthor.au_id = authors.au_id
JOIN 
    titles ON titleauthor.title_id = titles.title_id
GROUP BY 
    authors.au_id
ORDER BY 
    "TOTAL" DESC
LIMIT 3;

-- Cha4SQL4
-- Query for Best Selling Authors Ranking (All Authors)
SELECT 
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    COALESCE(SUM(titles.ytd_sales), 0) AS "TOTAL"
FROM 
    authors
LEFT JOIN 
    titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN 
    titles ON titleauthor.title_id = titles.title_id
GROUP BY 
    authors.au_id
ORDER BY 
    "TOTAL" DESC;