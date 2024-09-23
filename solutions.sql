-- Challenge 1 - Who Have Published What At Where?

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM authors

INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id

INNER JOIN titles 
ON titleauthor.title_id = titles.title_id

INNER JOIN 
    publishers 
ON titles.pub_id = publishers.pub_id;



-- Challenge 2 - Who Have Published How Many At Where?
SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, COUNT(titles.title_id)
FROM authors
INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
INNER JOIN titles 
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers 
ON titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, publishers.pub_name
ORDER BY authors.au_id, publishers.pub_name;



-- Challenge 3 - Best Selling Authors
SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) 
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC
LIMIT 3;



-- Challenge 4 - Best Selling Authors Ranking
SELECT authors.au_id, authors.au_lname, authors.au_fname, COALESCE(SUM(sales.qty), 0) 
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC;
