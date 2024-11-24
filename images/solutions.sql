-- Challenge 1 solution
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



-- Challenge 2 solution
SELECT authors.au_id AS "Author ID", 
       authors.au_lname AS "Last Name", 
       authors.au_fname AS "First Name",
       publishers.pub_name AS "Publisher",
       COUNT(titles.title) AS "Number of Titles"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
ORDER BY authors.au_id;


-- Challenge 3 solution
SELECT authors.au_id AS "Author ID", 
       authors.au_lname AS "Last Name", 
       authors.au_fname AS "First Name", 
       SUM(sales.qty) AS "Total"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY "Total" DESC
LIMIT 3;



-- Challenge 4 solution
SELECT authors.au_id AS "Author ID", 
       authors.au_lname AS "Last Name", 
       authors.au_fname AS "First Name", 
       COALESCE(SUM(sales.qty), 0) AS "Total"
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY "Total" DESC;




