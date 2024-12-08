
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, titles.title AS `TITLE`, publishers.pub_name AS `PUBLISHER`

FROM titleauthor
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id

LEFT JOIN `titles`
ON `titleauthor`.title_id = `titles`.title_id

LEFT JOIN `publishers`
ON `titles`.pub_id = `publishers`.pub_id

ORDER BY authors.au_id;





SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, publishers.pub_name AS `PUBLISHER`, count(titles.title) AS `TITLE COUNT`

FROM titleauthor
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id

LEFT JOIN `titles`
ON `titleauthor`.title_id = `titles`.title_id

LEFT JOIN `publishers`
ON `titles`.pub_id = `publishers`.pub_id

GROUP BY authors.au_id, publishers.pub_name

ORDER BY authors.au_id DESC, pub_name DESC;






SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, SUM(sales.qty) as TOTAL

FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id

LEFT JOIN sales
ON titleauthor.title_id = sales.title_id

GROUP BY authors.au_id

ORDER BY TOTAL DESC

LIMIT 3;




SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, IFNULL(SUM(sales.qty), 0) AS TOTAL

FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id

LEFT JOIN sales
ON titleauthor.title_id = sales.title_id

GROUP BY authors.au_id

ORDER BY TOTAL DESC

LIMIT 25;
