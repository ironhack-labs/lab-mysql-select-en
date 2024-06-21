


///CHALLENGE 1 ///
SELECT titleauthor.au_id AS "AUTHOR_ID",
    authors.au_lname AS "LASTNAME",
    authors.au_fname AS "FIRSTNAME",
    titles.title AS "TITLE",
    publishers.pub_name AS "PUBLISHER"
FROM 
    titleauthor
JOIN 
    authors ON titleauthor.au_id = authors.au_id
JOIN 
    titles ON titles.title_id = titleauthor.title_id
JOIN 
    publishers ON titles.pub_id = publishers.pub_id;


/// CHALLENGE 2 ///
SELECT titleauthor.au_id as autor_id,
    authors.au_lname as last_name,
    authors.au_fname as first_name,
    publishers.pub_name as publisher,
    COUNT(titles.title_id) AS number_of_titles 
FROM titleauthor
JOIN authors ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;



/// CHALLENGE 3///

Select
    titleauthor.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    COUNT(titles.title_id) AS "TOTAL"
FROM 
    titleauthor
JOIN 
    authors ON titleauthor.au_id = authors.au_id
JOIN 
    titles ON titles.title_id = titleauthor.title_id
GROUP BY 
    titleauthor.au_id, authors.au_lname, authors.au_fname
ORDER BY TOTAL DESC
LIMIT 3;




/// CHALLENGE 4 /// 
SELECT 
    authors.au_id as autorid
    authors.au_lname as last_name,
    authors.au_fname as first_name,
    COALESCE(COUNT(titles.title_id), 0) as "TOTAL"
FROM 
    authors
LEFT JOIN 
    titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN 
    titles ON titles.title_id = titleauthor.title_id
GROUP BY 
    authors.au_id, authors.au_lname, authors.au_fname
ORDER BY 
    TOTAL DESC;