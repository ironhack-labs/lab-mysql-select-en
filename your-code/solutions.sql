-- CHALLENGE 1 
/*
	joins various tables to figure out what titles each author has published at which publishers
*/
SELECT 
	a.au_id AS 'AUTHOR ID',a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME',
    t.title AS TITLE, p.pub_name AS PUBLISHER
FROM 
	publications.titles t INNER JOIN publications.publishers p ON t.pub_id = p.pub_id
		INNER JOIN publications.titleauthor t_a ON t.title_id = t_a.title_id
			INNER JOIN publications.authors a ON a.au_id = t_a.au_id
ORDER BY 
	a.au_id ASC, 
    PUBLISHER DESC;
    

-- CHALLENGE 2
/* 	
	Elevating from your solution in Challenge 1, query how many titles each 
	author has published at each publisher. Your output should look something like below:
*/
SELECT 
	a.au_id AS 'AUTHOR ID',a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME',
    p.pub_name AS PUBLISHER, COUNT(t.title) AS 'TITLE COUNT'
FROM 
	publications.titles t INNER JOIN publications.publishers p ON t.pub_id = p.pub_id
		INNER JOIN publications.titleauthor t_a ON t.title_id = t_a.title_id
			INNER JOIN publications.authors a ON a.au_id = t_a.au_id
GROUP BY PUBLISHER, a.au_id
ORDER BY 
	COUNT(t.title) DESC,
	a.au_id DESC, 
    PUBLISHER DESC;


-- CHALLENGE 3
/*
	Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
*/

SELECT 
	a.au_id AS 'AUTHOR ID',a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME',
    SUM(s.qty) AS TOTAL
FROM 
	publications.sales s INNER JOIN publications.titleauthor t_a ON s.title_id = t_a.title_id
		INNER JOIN publications.authors a ON a.au_id = t_a.au_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;


-- CHALLENGE 4
/*
	Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of 
    the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally 
    display 0 instead of NULL as the TOTAL)
*/
SELECT 
	a.au_id AS 'AUTHOR ID',a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME',
    IFNULL(SUM(s.qty),0) AS TOTAL
FROM 
	publications.sales s INNER JOIN publications.titleauthor t_a ON s.title_id = t_a.title_id
		RIGHT JOIN publications.authors a ON a.au_id = t_a.au_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;