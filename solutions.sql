

-- Solution Challange 1

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER"

FROM authors, titles, publishers, titleauthor

WHERE 
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id



-- Solution Challange 2

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
 publishers.pub_name AS "PUBLISHER", count(titles.title) AS "TITLE COUNT"

FROM authors, titles, publishers, titleauthor

WHERE 
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, publishers.pub_id
ORDER BY authors.au_fname ASC
;


-- Solution Challange 3

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
 sum(sales.qty) AS "TOTAL"

FROM authors, titles, sales, titleauthor

WHERE 
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN sales ON titles.title_id = sales.title_id

GROUP BY authors.au_id
ORDER BY "TOTAL" DESC
LIMIT 3
;


-- Solution Challange 4
SELECT authors.au_id AS "AUTHOR ID", 
       authors.au_lname AS "LAST NAME", 
       authors.au_fname AS "FIRST NAME", 
       COALESCE(SUM(sales.qty), 0) AS "TOTAL"
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY "TOTAL" DESC;


