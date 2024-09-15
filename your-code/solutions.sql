--
-- Query 1
--
SELECT a.au_id as "AUTHOR ID", 	a.au_lname as "LAST NAME", 	a.au_fname as "FIRST NAME",	t.title as "TITLE",	p.pub_name as "PUBLISHER"FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id INNER JOIN titles t ON ta.title_id = t.title_id INNER JOIN publishers p ON t.pub_id = p.pub_id
ORDER BY a.au_id ASC, t.title ASC;
;

--
-- Query 2
--
SELECT a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME",	p.pub_name as "PUBLISHER",	COUNT(*) as "TITLE COUNT" FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id INNER JOIN titles t ON ta.title_id = t.title_id INNER JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY "TITLE COUNT" DESC

--
-- Query 3
--
SELECT a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME",	SUM(s.qty) as "TOTAL" FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id LEFT JOIN titles t ON ta.title_id = t.title_id LEFT JOIN sales s ON ta.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC
LIMIT 3

--
-- Query 4
--
SELECT a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME",	IFNULL(SUM(s.qty), 0)	as "TOTAL" FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id LEFT JOIN titles t ON ta.title_id = t.title_id LEFT JOIN sales s ON ta.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC