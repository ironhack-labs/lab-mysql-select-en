### Challange 1
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

### Chalange 2
 SELECT 
    ta.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    COUNT(t.title_id) AS "TITLE COUNT"
FROM 
    titleauthor ta
JOIN 
    authors a ON ta.au_id = a.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers p ON t.pub_id = p.pub_id
GROUP BY 
    ta.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY 
    ta.au_id, p.pub_name;


### Chalange 3
SELECT 
    ta.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    SUM(s.qty) AS "TOTAL"
FROM 
    titleauthor ta
JOIN 
    authors a ON ta.au_id = a.au_id
JOIN 
    sales s ON ta.title_id = s.title_id
GROUP BY 
    ta.au_id, a.au_lname, a.au_fname
ORDER BY 
    "TOTAL" DESC
LIMIT 3;

### Chalange 4 
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    COALESCE(SUM(s.qty), 0) AS "TOTAL"
FROM 
    authors a
LEFT JOIN 
    titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN 
    sales s ON ta.title_id = s.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    "TOTAL" DESC;