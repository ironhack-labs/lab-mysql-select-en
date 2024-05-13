### Challenge 1 - Who Have Published What At Where?
## Titles each author has published at which publishers. Your output should have at least the following columns:

#- `AUTHOR ID` - the ID of the author
#- `LAST NAME` - author last name
#- `FIRST NAME` - author first name
#- `TITLE` - name of the published title
#- `PUBLISHER` - name of the publisher where the title was published

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', t.title AS 'TITLE', p.pub_name AS 'PUBLISHER'
FROM publications.authors a
JOIN publications.titleauthor ta ON a.au_id = ta.au_id
JOIN publications.titles t ON ta.title_id = t.title_id
JOIN publications.publishers p ON t.pub_id = p.pub_id;

### Challenge 2 - Who Have Published How Many At Where?

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', COUNT(t.title) AS 'TITLE COUNT'
FROM publications.authors a
JOIN publications.titleauthor ta ON a.au_id = ta.au_id
JOIN publications.titles t ON ta.title_id = t.title_id
JOIN publications.publishers p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_id;

## Challenge 3 - Best Selling Authors

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', COUNT(t.title) AS 'TITLE COUNT'
FROM publications.authors a
JOIN publications.titleauthor ta ON a.au_id = ta.au_id
JOIN publications.titles t ON ta.title_id = t.title_id
GROUP BY a.au_id
ORDER BY count(t.title) DESC
LIMIT 3;


## Challenge 4 - Best Selling Authors Ranking

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', COALESCE(COUNT(t.title), 0) AS 'TOTAL'
FROM publications.authors a
LEFT JOIN publications.titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN publications.titles t ON ta.title_id = t.title_id
LEFT JOIN publications.publishers p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_id
ORDER BY 'TOTAL' DESC;
