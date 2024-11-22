-- Q1

SELECT authors.au_id AS "Author ID", 
authors.au_lname AS "Last name", 
authors.au_fname AS "First name",
titles.title AS "Title",
publishers.pub_name as "Publisher"

FROM authors, titleauthor, titles, publishers

WHERE
	authors.au_id == titleauthor.au_id AND
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id


-- Q2

SELECT authors.au_id AS "Author ID", 
authors.au_lname AS "Last name", 
authors.au_fname AS "First name",
publishers.pub_name as "Publisher",
count(titles.title) AS "Total titles"


FROM authors, titleauthor, titles, publishers

WHERE
	authors.au_id == titleauthor.au_id AND
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id

GROUP BY 
    authors.au_id, authors.au_lname, authors.au_fname
-- ORDER BY 
--     "Total Titles" DESC;


-- Q3
SELECT 
    authors.au_id AS "Author_ID",
    authors.au_lname AS "Last_name",
    authors.au_fname AS "First_name",
    publishers.pub_name AS "Publisher",
    SUM(sales.qty) AS "Total_sales"
FROM 
    authors
    INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
    INNER JOIN titles ON titleauthor.title_id = titles.title_id
    INNER JOIN publishers ON titles.pub_id = publishers.pub_id
    INNER JOIN sales ON titles.title_id = sales.title_id
WHERE 
    sales.qty IS NOT NULL
GROUP BY 
    authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
ORDER BY 
    "Total_sales" DESC LIMIT 3;


-- Q4
