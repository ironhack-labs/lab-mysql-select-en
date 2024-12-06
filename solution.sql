/*    CHALLENGE  1      */
SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    t.title AS TITLE,
    p.pub_name AS PUBLISHER
FROM authors a
JOIN titleauthor at ON a.au_id = at.au_id
JOIN titles t ON at.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
ORDER BY a.au_id ASC;

 /*    CHALLENGE 2         */
 
SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    p.pub_name AS PUBLISHER,
    COUNT(t.title_id) AS TITLE_COUNT
FROM authors a
JOIN titleauthor at ON a.au_id = at.au_id
JOIN titles t ON at.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_id
ORDER BY a.au_id DESC;
 
  /*    CHALLENGE 3       */

SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    COUNT(t.title_id) AS TITLE_COUNT
FROM authors a
JOIN titleauthor at ON a.au_id = at.au_id
JOIN titles t ON at.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TITLE_COUNT DESC
LIMIT 3;

 /*    CHALLENGE 4      */
SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    COUNT(t.title_id) AS TITLE_COUNT
FROM authors a
LEFT JOIN titleauthor at ON a.au_id = at.au_id
LEFT JOIN titles t ON at.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TITLE_COUNT DESC;
