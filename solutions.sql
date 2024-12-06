# Challenge 1

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    t.title AS "TITLE",
    tp.pub_name AS "PUBLISHER"
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers tp ON t.pub_id = tp.pub_id
ORDER BY 
    a.au_id;
    
# Challenge 2

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    COUNT(t.title_id) AS "TITLE_COUNT"
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers p ON t.pub_id = p.pub_id
group by
	a.au_id, p.pub_id
ORDER BY 
    a.au_id, p.pub_id;
    
# Challenge 3

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    sum(s.qty) AS "TOTAL"
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    sales s ON ta.title_id = s.title_id
group by
	a.au_id
ORDER BY 
    "TOTAL" DESC 
    LIMIT 3;
    
# Challenge 4

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    COALESCE(SUM(s.qty), 0) AS "TOTAL"
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    sales s ON ta.title_id = s.title_id
group by
	a.au_id
ORDER BY 
    "TOTAL" DESC;
