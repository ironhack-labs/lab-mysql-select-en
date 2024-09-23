USE publications;

## Challenge 1 - Who Have Published What At Where?
SELECT 
	authors.au_id,
    authors.au_lname,
    authors.au_fname,
    titles.title,
    publishers.pub_name
FROM 
	authors
JOIN
	titleauthor ON authors.au_id = titleauthor.au_id
JOIN
	titles ON titleauthor.title_id = titles.title_id
JOIN
	publishers ON titles.pub_id = publishers.pub_id;

## Challenge 2 - Who Have Published How Many At Where?
SELECT 
	authors.au_id,
    authors.au_lname,
    authors.au_fname,
    count(titles.title) AS count_titles,
    publishers.pub_name
FROM 
	authors
JOIN
	titleauthor ON authors.au_id = titleauthor.au_id
JOIN
	titles ON titleauthor.title_id = titles.title_id
JOIN
	publishers ON titles.pub_id = publishers.pub_id
GROUP BY 
	pub_name, au_id
ORDER BY count_titles DESC;

## Challenge 3 - Best Selling Authors
SELECT
	authors.au_id,
    authors.au_lname,
    authors.au_fname,
    SUM(sales.qty) AS total_QTY
FROM 
	authors
JOIN
	titleauthor ON authors.au_id = titleauthor.au_id
JOIN
	sales ON sales.title_id = titleauthor.title_id
GROUP BY
	au_id
ORDER BY total_QTY DESC
LIMIT 3;
	
## Challenge 4 - Best Selling Authors Ranking
SELECT
	authors.au_id,
    authors.au_lname,
    authors.au_fname,
    COALESCE(SUM(sales.qty),0) AS total_QTY
FROM 
	authors
LEFT JOIN
	titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN
	sales ON sales.title_id = titleauthor.title_id
GROUP BY
	au_id
ORDER BY total_QTY DESC;

