-- c1
SELECT 
    a.author_id AS 'AUTHOR ID',
    a.last_name AS 'LAST NAME',
    a.first_name AS 'FIRST NAME',
    t.title AS 'TITLE',
    p.publisher AS 'PUBLISHER'
FROM 
    authors AS a
JOIN 
    titleauthor AS ta ON a.author_id = ta.author_id
JOIN 
    titles AS t ON ta.title_id = t.title_id
JOIN 
    publishers AS p ON t.publisher_id = p.publisher_id
ORDER BY 
    a.author_id, t.title;
--
-- c2
SELECT 
    a.author_id AS 'AUTHOR ID',
    a.last_name AS 'LAST NAME',
    a.first_name AS 'FIRST NAME',
    p.publisher AS 'PUBLISHER',
    COUNT(t.title_id) AS 'TITLE COUNT'
FROM 
    authors AS a
JOIN 
    titleauthor AS ta ON a.author_id = ta.author_id
JOIN 
    titles AS t ON ta.title_id = t.title_id
JOIN 
    publishers AS p ON t.publisher_id = p.publisher_id
GROUP BY 
    a.author_id, a.last_name, a.first_name, p.publisher
ORDER BY 
    a.author_id, p.publisher;
--
-- c3
SELECT 
    a.author_id AS 'AUTHOR ID',
    a.last_name AS 'LAST NAME',
    a.first_name AS 'FIRST NAME',
    COUNT(ta.title_id) AS 'TOTAL'
FROM 
    authors AS a
JOIN 
    titleauthor AS ta ON a.author_id = ta.author_id
GROUP BY 
    a.author_id, a.last_name, a.first_name
ORDER BY 
    TOTAL DESC
LIMIT 3;
--
-- c4
SELECT 
    a.author_id AS 'AUTHOR ID',
    a.last_name AS 'LAST NAME',
    a.first_name AS 'FIRST NAME',
    IFNULL(COUNT(ta.title_id), 0) AS 'TOTAL'
FROM 
    authors AS a
LEFT JOIN 
    titleauthor AS ta ON a.author_id = ta.author_id
GROUP BY 
    a.author_id, a.last_name, a.first_name
ORDER BY 
    TOTAL DESC;
--