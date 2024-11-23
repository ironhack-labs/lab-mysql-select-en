# querry 1

SELECT 
    authors.au_id AS "Author ID", 
    authors.au_lname AS "Last name", 
    authors.au_fname AS "First name",
    titles.title AS "Title",
    publishers.pub_name as "Publisher"

FROM authors, titleauthor, titles, publishers

WHERE
	authors.au_id == titleauthor.au_id AND
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id


# querry 2

SELECT
	authors.au_id AS "Author ID", 
	authors.au_lname AS "Last name", 
	authors.au_fname AS "First name",
	count(titles.title) AS "Title__count",
	publishers.pub_name as "Publisher"

FROM authors, titleauthor, titles, publishers

WHERE
	authors.au_id == titleauthor.au_id AND
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id
GROUP BY 
	authors.au_id, 
	authors.au_lname, 
	authors.au_fname, 
	publishers.pub_name	

# query 3

SELECT
    authors.au_id AS "Author ID", 
    authors.au_lname AS "Last Name", 
    authors.au_fname AS "First Name",
    SUM(titles.ytd_sales) AS "Total"
FROM
    authors, titleauthor, titles
WHERE
    authors.au_id = titleauthor.au_id AND
    titleauthor.title_id = titles.title_id
GROUP BY 
    authors.au_id, 
    authors.au_lname, 
    authors.au_fname
ORDER BY 
    SUM(titles.ytd_sales) DESC
LIMIT 3;

# query 4

SELECT
    authors.au_id AS "Author ID",
    authors.au_lname AS "Last Name",
    authors.au_fname AS "First Name",
    COALESCE(SUM(titles.ytd_sales), 0) AS "Total"
FROM
    authors, titleauthor, titles
WHERE
    authors.au_id = titleauthor.au_id AND
    titleauthor.title_id = titles.title_id
GROUP BY 
    authors.au_id, 
    authors.au_lname, 
    authors.au_fname

UNION

SELECT
    authors.au_id AS "Author ID",
    authors.au_lname AS "Last Name",
    authors.au_fname AS "First Name",
    0 AS "Total"
FROM
    authors
WHERE 
    authors.au_id NOT IN (xa
        SELECT DISTINCT au_id FROM titleauthor
    )
ORDER BY 
    "Total" DESC;
