-- Active: 1715604236256@@127.0.0.1@3306@publications
#CHALLENGE 1
SELECT 
    authors.au_id as AUTHOR_ID,
    authors.au_lname as LAST_NAME,
    authors.au_fname as FIRST_NAME,
    titles.title as TITLE,
    publishers.pub_name as PUBLISHER_NAME
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id 
JOIN titles ON titleauthor.title_id = titles.title_id 
JOIN publishers ON publishers.pub_id = titles.pub_id;

#CHALLENGE 2
SELECT
    authors.au_id AS AUTHOR_ID,
    authors.au_lname as LAST_NAME,
    authors.au_fname AS FIRST_NAME,
    publishers.pub_name AS PUBLISHER_NAME,
    COUNT(titles.title_id) AS TITLE_COUNT
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id 
JOIN titles ON titleauthor.title_id = titles.title_id 
JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY authors.au_id, publishers.pub_name;

#CHALLENGE 3
SELECT 
    authors.au_id AS AUTHOR_ID,
    authors.au_lname AS LAST_NAME,
    authors.au_fname AS FIRST_NAME,
    COUNT(titles.title_id) AS TOTAL
FROM 
    authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id 
JOIN titles ON titleauthor.title_id = titles.title_id 
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

#CHALLENGE 4
SELECT 
    authors.au_id AS AUTHOR_ID,
    authors.au_lname AS LAST_NAME,
    authors.au_fname AS FIRST_NAME,
    COALESCE(COUNT(titles.title_id), 0) AS TOTAL
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles ON titleauthor.title_id = titles.title_id 
GROUP BY authors.au_id
ORDER BY TOTAL DESC;