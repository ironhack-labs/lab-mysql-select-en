#Challenge 1 - Who Have Published What At Where?
SELECT 
authors.au_id AS `AUTHOR ID`, 
authors.au_lname AS `LAST NAME`, 
authors.au_fname AS `FIRST NAME`, 
titles.title AS `TITLE`, 
publishers.pub_name AS `PUBLISHER` 
FROM publication.authors
JOIN publication.titleauthor ON authors.au_id = titleauthor.au_id
JOIN publication.titles ON titleauthor.title_id = titles.title_id
JOIN publication.publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id ASC, publishers.pub_name ASC;

#Challenge 2 - Who Have Published How Many At Where?
SELECT 
authors.au_id AS `AUTHOR ID`, 
authors.au_lname AS `LAST NAME`, 
authors.au_fname AS `FIRST NAME`,  
publishers.pub_name AS `PUBLISHER`,
count(titles.title) AS `TITLE COUNT` 
FROM publication.authors
JOIN publication.titleauthor ON authors.au_id = titleauthor.au_id
JOIN publication.titles ON titleauthor.title_id = titles.title_id
JOIN publication.publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
ORDER BY authors.au_id ASC, publishers.pub_name ASC;

#Challenge 3 - Best Selling Authors
SELECT 
authors.au_id AS `AUTHOR ID`, 
authors.au_lname AS `LAST NAME`, 
authors.au_fname AS `FIRST NAME`,  
SUM(sales.qty) AS `TOTAL` 
FROM publication.authors
JOIN publication.titleauthor ON authors.au_id = titleauthor.au_id
JOIN publication.sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) DESC
LIMIT 3;

#Challenge 4 - Best Selling Authors Ranking
SELECT 
authors.au_id AS `AUTHOR ID`, 
authors.au_lname AS `LAST NAME`, 
authors.au_fname AS `FIRST NAME`,  
IFNULL(SUM(sales.qty), 0) AS `TOTAL` 
FROM publication.authors
LEFT JOIN publication.titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN publication.sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) DESC;