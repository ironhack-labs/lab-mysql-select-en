/* Challenge 1 - Who Have Published What At Where?
In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published */

SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    t.title AS TITLE,
    p.pub_name AS PUBLISHER
FROM publications.authors a
JOIN publications.titleauthor ta ON a.au_id = ta.au_id  -- Join authors to title_authors
JOIN publications.titles t ON ta.title_id = t.title_id       -- Join title_authors to titles
JOIN publications.publishers p ON t.pub_id = p.pub_id        -- Join titles to publishers
ORDER BY a.au_id;                            -- Optional, to order by author ID

/* Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. */

SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    p.pub_name AS PUBLISHER,
    COUNT(t.title_id) AS TITLE_COUNT
FROM publications.authors AS a
JOIN publications.titleauthor AS ta 
  ON a.au_id = ta.au_id
JOIN publications.titles AS t 
  ON ta.title_id = t.title_id
JOIN publications.publishers AS p 
  ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY a.au_id, p.pub_name;

/* Challenge 3 - Best Selling Authors
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors. */

SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    SUM(s.qty) AS TOTAL
FROM publications.authors AS a
JOIN publications.titleauthor AS ta 
  ON a.au_id = ta.au_id
JOIN publications.titles AS t 
  ON ta.title_id = t.title_id
JOIN publications.sales AS s 
  ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC
LIMIT 3;

/* Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output 
(ideally display 0 instead of NULL as the TOTAL). 
Also order your results based on TOTAL from high to low. */

SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    SUM(CASE WHEN s.qty IS NULL THEN 0 ELSE s.qty END) AS TOTAL
FROM publications.authors AS a
LEFT JOIN publications.titleauthor AS ta 
  ON a.au_id = ta.au_id
LEFT JOIN publications.titles AS t 
  ON ta.title_id = t.title_id
LEFT JOIN publications.sales AS s 
  ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC;