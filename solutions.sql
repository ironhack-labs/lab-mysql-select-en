""" Challange 1"""
SELECT 
    titleauthor.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    titles.title AS "TITLE",
    publishers.pub_name AS "PUBLISHER"
FROM 
    titleauthor
JOIN 
    authors ON titleauthor.au_id = authors.au_id
JOIN 
    titles ON titles.title_id = titleauthor.title_id
JOIN 
    publishers ON titles.pub_id = publishers.pub_id;
    
    
"""Challange 2 """
SELECT 
    titleauthor.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    publishers.pub_name AS "PUBLISHER",
    COUNT(titles.title_id) AS "NUMBER OF TITLES"
FROM 
    titleauthor
JOIN 
    authors ON titleauthor.au_id = authors.au_id
JOIN 
    titles ON titles.title_id = titleauthor.title_id
JOIN 
    publishers ON titles.pub_id = publishers.pub_id
GROUP BY 
    titleauthor.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;
    
    """ Challange 3"""
    SELECT 
    titleauthor.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    COUNT(titles.title_id) AS "TOTAL"
FROM 
    titleauthor
JOIN 
    authors ON titleauthor.au_id = authors.au_id
JOIN 
    titles ON titles.title_id = titleauthor.title_id
GROUP BY 
    titleauthor.au_id, authors.au_lname, authors.au_fname
ORDER BY TOTAL DESC
LIMIT 3;

"""Challange 4 """
SELECT 
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    COALESCE(COUNT(titles.title_id), 0) AS "TOTAL"
FROM 
    authors
LEFT JOIN 
    titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN 
    titles ON titles.title_id = titleauthor.title_id
GROUP BY 
    authors.au_id, authors.au_lname, authors.au_fname
ORDER BY 
    TOTAL DESC;