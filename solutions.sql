-- Query 1
/*Challenge 1 - Who Have Published What At Where?*/

SELECT 
	authors.au_id as "AUTHOR ID", au_lname as 'LAST NAME', au_fname as 'FIRST NAME', 
    titleS.title as 'TITLE', pub_name as 'PUBLISHER'
FROM publications.authors 
INNER JOIN publications.titleauthor 
	ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
	ON publications.titleauthor.title_id = publications.titles.title_id
INNER JOIN publications.publishers
	ON publications.titles.pub_id = publications.publishers.pub_id
ORDER BY authors.au_id asc;

-- Query 2
/*Challenge 2 - Who Have Published How Many At Where?*/

SELECT 
	authors.au_id as "AUTHOR ID", au_lname as 'LAST NAME', au_fname as 'FIRST NAME', 
    pub_name as 'PUBLISHER', COUNT(title) as 'Title Count' 
FROM publications.authors 
INNER JOIN publications.titleauthor 
	ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
	ON publications.titleauthor.title_id = publications.titles.title_id
INNER JOIN publications.publishers
	ON publications.titles.pub_id = publications.publishers.pub_id
GROUP BY authors.au_id, pub_name
ORDER BY authors.au_id desc;

-- Query 3
/*Challenge 3 - Best Selling Authors*/

SELECT 
	authors.au_id as "AUTHOR ID", au_lname as 'LAST NAME', au_fname as 'FIRST NAME', 
    SUM(ytd_sales) as 'total'
FROM publications.authors 
INNER JOIN publications.titleauthor 
	ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
	ON publications.titleauthor.title_id = publications.titles.title_id

GROUP BY authors.au_id
ORDER BY sum(ytd_sales) desc
LIMIT 3;

-- Query 4
/*Challenge 4 - Best Selling Authors Ranking*/

SELECT 
	authors.au_id as "AUTHOR ID", au_lname as 'LAST NAME', au_fname as 'FIRST NAME', 
    coalesce(SUM(ytd_sales), 0) as 'total'
FROM publications.authors 
LEFT JOIN publications.titleauthor 
	ON publications.authors.au_id = publications.titleauthor.au_id
LEFT JOIN publications.titles
	ON publications.titleauthor.title_id = publications.titles.title_id

GROUP BY authors.au_id
ORDER BY sum(ytd_sales) desc
LIMIT 23;

    

