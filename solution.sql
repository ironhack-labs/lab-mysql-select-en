+-+--challnege 1
SELECT 
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    t.title AS 'TITLE',
    p.pub_name AS 'PUBLISHER'
FROM
    authors a
JOIN
    titleauthor ta ON a.au_id = ta.au_id
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    publishers p ON t.pub_id = p.pub_id;

    ---challenge 2
SELECT 
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    p.pub_name AS 'PUBLISHER',
    COUNT(*) AS 'NUMBER OF TITLES'
FROM
    authors a
JOIN
    titleauthor ta ON a.au_id = ta.au_id
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    publishers p ON t.pub_id = p.pub_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname, p.pub_name;

---challenge 3
SELECT 
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    COUNT(t.title_id) AS 'NUMBER OF TITLES',
    SUM(s.qty) AS 'TOTAL SALES'
FROM
    authors a
JOIN
    titleauthor ta ON a.au_id = ta.au_id
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    sales s ON t.title_id = s.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    SUM(s.qty) DESC
LIMIT 3;

---challenge 4
SELECT 
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    COUNT(t.title_id) AS 'NUMBER OF TITLES',
    IFNULL(SUM(s.qty), 0) AS 'TOTAL SALES'
FROM
    authors a
LEFT JOIN
    titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN
    titles t ON ta.title_id = t.title_id
LEFT JOIN
    sales s ON t.title_id = s.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    `TOTAL SALES` DESC;
