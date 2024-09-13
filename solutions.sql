-- Challenge 1
SELECT 
authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME", 
titles.title AS "TITLE", 
publishers.pub_name AS "PUBLSIHER"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id, titles.title;

-- Challenge 2
SELECT 
authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME", 
publishers.pub_name AS "PUBLSIHER",
COUNT(titles.title) AS "TITLE COUNT" 
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id
ORDER BY COUNT() DESC, authors.au_id DESC;

-- Challenge 3
SELECT 
authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME", 
SUM(sales.qty) AS "TOTAL" 
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN sales ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC
LIMIT 3;

-- Challenge 4
SELECT 
authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME", 
IFNULL(SUM(sales.qty), 0) AS "TOTAL"
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC;
