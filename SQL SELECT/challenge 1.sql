SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    t.title AS "TITLE",
    p.pub_name AS "PUBLISHER"
FROM 
    titleauthor ta
JOIN 
    authors a ON ta.au_id = a.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers p ON t.pub_id = p.pub_id;
