-- Challenge 1
SELECT a.au_id, a.au_lname, a.au_fname, ta.au_id,ta.title_id,t.title_id,t.title,t.pub_id,p.pub_id FROM authors a INNER JOIN titleauthor ta ON  a.au_id == ta.au_id INNER JOIN titles t ON t.title_id == ta.title_id INNER JOIN publishers p ON p.pub_id == t.pub_id;
-- Challenge 2
SELECT a.au_id, a.au_lname, a.au_fname, p.pub_id, p.pub_name, COUNT(t.title_id) AS title_count FROM authors a INNER JOIN titleauthor ta ON a.au_id = ta.au_id INNER JOIN titles t ON t.title_id = ta.title_id INNER JOIN publishers p ON p.pub_id = t.pub_id GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_id, p.pub_name ORDER BY COUNT(t.title_id) DESC;
-- Challenge 3
SELECT a.au_id, a.au_lname, a.au_fname,  SUM(s.ord_num) AS number_of_sales FROM authors a INNER JOIN titleauthor ta ON a.au_id = ta.au_id INNER JOIN sales s ON s.title_id = ta.title_id GROUP BY a.au_id ORDER BY number_of_sales DESC LIMIT 3;
-- Challenge 4
SELECT a.au_id, a.au_lname, a.au_fname,  SUM(COALESCE(s.qty,0)) AS number_of_sales FROM authors a FULL JOIN titleauthor ta ON a.au_id = ta.au_id FULL JOIN sales s ON s.title_id = ta.title_id GROUP BY a.au_id ORDER BY number_of_sales DESC