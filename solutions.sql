### Challenge 1

SELECT authors.au_id, au_lname, au_fname, title, pub_name
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
;

### Challenge 2

SELECT authors.au_id, au_lname, au_fname, pub_name, COUNT(titles.title_id) AS title_count
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY title_count DESC;


### Challenge 3

SELECT authors.au_id, au_lname, au_fname, SUM(sales.qty) AS total 
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY total DESC
LIMIT 3;


### Challenge 4

SELECT authors.au_id, au_lname, au_fname, COALESCE(SUM(sales.qty), 0) AS total 
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY total DESC;
