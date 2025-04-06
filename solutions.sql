USE publications;

SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    tt.title AS TITLE,
    p.pub_name AS PUBLISHER
FROM 
    authors a
JOIN 
    titleauthor t ON a.au_id = t.au_id
JOIN 
    titles tt ON t.title_id = tt.title_id
JOIN 
    publishers p ON tt.pub_id = p.pub_id;
    
SELECT COUNT(*) FROM titleauthor;

SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME, 
    p.pub_name AS PUBLISHER,
    COUNT(t.title_id) AS `TITLE COUNT`
FROM 
    authors a
JOIN 
    titleauthor t ON a.au_id = t.au_id
JOIN 
    titles tt ON t.title_id = tt.title_id
JOIN 
    publishers p ON tt.pub_id = p.pub_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY 
    a.au_fname, p.pub_name;
    
SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME, 
    COUNT(t.title_id) AS `TITLE COUNT`
FROM 
    authors a
JOIN 
    titleauthor t ON a.au_id = t.au_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    `TITLE COUNT` DESC
LIMIT 3;

SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME, 
    IFNULL(COUNT(t.title_id), 0) AS `TITLE COUNT`
FROM 
    authors a
LEFT JOIN  
    titleauthor t ON a.au_id = t.au_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    `TITLE COUNT` DESC