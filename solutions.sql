-- CHALLENGE 1
SELECT
	publications.authors.au_id,
    au_lname,
    au_fname,
    publications.titles.title
    pub_name
FROM publications.authors
INNER JOIN publications.titleauthor
	ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
	ON publications.titleauthor.title_id = publications.titles.title_id
INNER JOIN publications.publishers
	ON publications.titles.pub_id = publications.publishers.pub_id;

-- CHALLENGE 2
SELECT
	publications.authors.au_id,
    au_lname,
    au_fname,
    pub_name,
    COUNT(publications.titles.title)
FROM publications.authors
INNER JOIN publications.titleauthor
	ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
	ON publications.titleauthor.title_id = publications.titles.title_id
INNER JOIN publications.publishers
	ON publications.titles.pub_id = publications.publishers.pub_id
GROUP BY publications.authors.au_id, pub_name
ORDER BY publications.authors.au_id DESC;

-- CHALLENGE 3
SELECT
	publications.authors.au_id,
    au_lname,
    au_fname,
    SUM(ytd_sales) AS total
FROM publications.authors
INNER JOIN publications.titleauthor
	ON publications.authors.au_id = publications.titleauthor.au_id
INNER JOIN publications.titles
	ON publications.titleauthor.title_id = publications.titles.title_id
GROUP BY publications.authors.au_id
ORDER BY total DESC
LIMIT 3;

-- CHALLENGE 4
SELECT
	publications.authors.au_id,
    au_lname,
    au_fname,
    COALESCE(SUM(ytd_sales),0) AS total
FROM publications.authors
LEFT JOIN publications.titleauthor
	ON publications.authors.au_id = publications.titleauthor.au_id
LEFT JOIN publications.titles
	ON publications.titleauthor.title_id = publications.titles.title_id
GROUP BY publications.authors.au_id
ORDER BY total DESC
LIMIT 23;