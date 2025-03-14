USE publications;

-- CHALLENGE 1
-- SELECT query that joins various tables to figure out what titles each author has published at which publishers
SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
ORDER BY a.au_id;

-- CHALLENGE 2
-- How many titles each author has published at each publisher
SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, COUNT(t.title) AS title_count
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY p.pub_id, a.au_id
ORDER BY a.au_id DESC;

-- CHALLENGE 3
-- Top 3 authors who have sold the highest number of titles
SELECT a.au_id, a.au_lname, a.au_fname, COUNT(t.title) AS total
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
GROUP BY a.au_id
ORDER BY total DESC
LIMIT 3;

-- CHALLENGE 4
-- Modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3.
SELECT a.au_id, a.au_lname, a.au_fname, COUNT(t.title) AS total
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
GROUP BY a.au_id
ORDER BY total DESC;