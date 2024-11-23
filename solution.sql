# querry 1

SELECT 
    authors.au_id AS "Author ID",
    authors.au_lname AS "Last name",
    authors.au_fname AS "First name",
    titles.title AS "Title",
    publishers.pub_name as "Publisher"
FROM 
    authors
    JOIN titleauthor ON authors.au_id = titleauthor.au_id
    JOIN titles ON titleauthor.title_id = titles.title_id
    JOIN publishers ON titles.pub_id = publishers.pub_id;


# querry 2

SELECT
    authors.au_id AS "Author ID",
    authors.au_lname AS "Last name",
    authors.au_fname AS "First name",
    COUNT(titles.title_id) AS "Title Count",
    publishers.pub_name as "Publisher"
FROM 
    authors
    LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
    LEFT JOIN titles ON titleauthor.title_id = titles.title_id
    LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY 
    authors.au_id, 
    authors.au_lname, 
    authors.au_fname, 
    publishers.pub_name
ORDER BY
    "Title Count" DESC;

# query 3

SELECT
    authors.au_id AS "Author ID",
    authors.au_lname AS "Last Name",
    authors.au_fname AS "First Name",
    SUM(titles.ytd_sales) AS "Total"
FROM
    authors
    LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
    LEFT JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY 
    authors.au_id, 
    authors.au_lname, 
    authors.au_fname
ORDER BY 
    "Total" DESC
LIMIT 3;

# query 4

SELECT
    authors.au_id AS "Author ID",
    authors.au_lname AS "Last Name",
    authors.au_fname AS "First Name",
    COALESCE(SUM(titles.ytd_sales), 0) AS "Total"
FROM
    authors
    LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
    LEFT JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY 
    authors.au_id, 
    authors.au_lname, 
    authors.au_fname
ORDER BY 
    "Total" DESC;
