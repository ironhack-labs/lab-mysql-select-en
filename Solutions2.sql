-- MySQL SELECT Lab Solutions
-- Author: Gerardo

-- Challenge 1: Retrieve authors with their published titles and publishers
SELECT 
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    t.title AS 'TITLE',
    p.pub_name AS 'PUBLISHER'
FROM titleauthor ta
JOIN author a ON ta.au_id = a.au_id
JOIN title t ON ta.title_id = t.title_id
JOIN publisher p ON t.pub_id = p.pub_id;

-- Challenge 2: Count how many titles each author has published at each publisher
SELECT 
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    p.pub_name AS 'PUBLISHER',
    COUNT(t.title_id) AS 'TITLE COUNT'
FROM titleauthor ta
JOIN author a ON ta.au_id = a.au_id
JOIN title t ON ta.title_id = t.title_id
JOIN publisher p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_name;

-- Challenge 3: Retrieve the top 3 best-selling authors based on total titles sold
SELECT 
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    SUM(s.qty) AS 'TOTAL'
FROM sales s
JOIN title t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN author a ON ta.au_id = a.au_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4: Retrieve all 23 authors ranked by total titles sold (including authors with 0 sales)
SELECT 
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    COALESCE(SUM(s.qty), 0) AS 'TOTAL'
FROM author a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN title t ON ta.title_id = t.title_id
LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;
