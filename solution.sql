"Challenge 1"
SELECT  a.au_id AS "Author ID" , au_lname AS "Last name", au_fname AS "First name" , title As "Title", pub_name as "Publisher name"
FROM authors a INNER JOIN titleauthor ta on a.au_id = ta.au_id INNER JOIN titles t ON ta.title_id = t.title_id INNER JOIN publishers p ON t.pub_id = p.pub_id;

"Challenge 2"
SELECT   a.au_id AS "Author ID" , au_lname AS "Last name", au_fname AS "First name" , pub_name as "Publisher name", COUNT(t.title) As "Title Count" 
FROM authors a INNER JOIN titleauthor ta on a.au_id = ta.au_id INNER JOIN titles t ON ta.title_id = t.title_id INNER JOIN publishers p ON t.pub_id = p.pub_id 
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name ORDER BY "Title Count" DESC

"Challenge 3"
SELECT   a.au_id AS "Author ID" , au_lname AS "Last name", au_fname AS "First name" , SUM(s.qty) AS "Total" 
FROM authors a INNER JOIN titleauthor ta on a.au_id = ta.au_id  INNER JOIN sales s ON s.title_id = ta.title_id  
GROUP BY a.au_id, a.au_lname, a.au_fname ORDER BY Total DESC LIMIT 3;

"Challenge 4"
SELECT   a.au_id AS "Author ID" , au_lname AS "Last name", au_fname AS "First name" ,  IFNULL(SUM(s.qty), 0) AS "Total" 
FROM authors a INNER JOIN titleauthor ta on a.au_id = ta.au_id  INNER JOIN sales s ON s.title_id = ta.title_id  
GROUP BY a.au_id, a.au_lname, a.au_fname ORDER BY Total DESC ;








