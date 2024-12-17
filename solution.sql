/* C1 */
SELECT 
    a.au_id AS AUTHOR_ID, 
    a.au_lname AS LAST_NAME, 
    a.au_fname AS FIRST_NAME, 
    t.title AS TITLE, 
    p.pub_name AS PUBLISHER
FROM publications.authors a
JOIN publications.titleauthor ta ON a.au_id = ta.au_id  
JOIN publications.titles t ON ta.title_id = t.title_id  
JOIN publications.publishers p ON t.pub_id = p.pub_id;  

/* C2 */
SELECT 
    a.au_id AS AUTHOR_ID, 
    a.au_lname AS LAST_NAME, 
    a.au_fname AS FIRST_NAME, 
    p.pub_name AS PUBLISHER, 
    COUNT(t.title_id) AS NUM_TITLES
FROM publications.authors a
JOIN publications.titleauthor ta ON a.au_id = ta.au_id 
JOIN publications.titles t ON ta.title_id = t.title_id 
JOIN publications.publishers p ON t.pub_id = p.pub_id 
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name 
ORDER BY a.au_fname ASC

/* C3 */
SELECT 
	a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    SUM(s.qty) AS TOTAL
FROM publications. authors a 
JOIN publications.titleauthor ta ON a.au_id = ta.au_id
JOIN publications.titles t ON ta.title_id = t.title_id
JOIN publications.sales s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC
LIMIT 3;

/* C4 */
SELECT 
	a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    COALESCE(sum(s.qty), 0) AS TOTAL
FROM publications.authors a 
LEFT JOIN publications.titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN publications.titles t ON ta.title_id = t.title_id
LEFT JOIN publications.sales s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC;
