USE publications;

/* Challenge 1*/
SELECT authors.au_id AS `AUTHOR ID`, 
	authors.au_lname AS `LAST NAME`, 
	authors.au_fname AS `FIRST NAME`,
    titles.title AS `TITLE`,
    publishers.pub_name AS `PUBLISHER`
    
FROM authors INNER JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
        INNER JOIN titles
        ON titleauthor.title_id = titles.title_id
        INNER JOIN publishers
        on titles.pub_id = publishers.pub_id
        ORDER BY `AUTHOR ID`;
        
        
/* Challenge 2*/
SELECT authors.au_id AS `AUTHOR ID`, 
	authors.au_lname AS `LAST NAME`, 
	authors.au_fname AS `FIRST NAME`,
    publishers.pub_name AS `PUBLISHER`,
    COUNT(titles.title) AS `TITLE COUNT`
    
FROM authors INNER JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
        INNER JOIN titles
        ON titleauthor.title_id = titles.title_id
        INNER JOIN publishers
        on titles.pub_id = publishers.pub_id
        GROUP BY `AUTHOR ID`, `PUBLISHER`
        ORDER BY `AUTHOR ID` DESC, `TITLE COUNT` DESC;
        

/* Challenge 3 */

SELECT authors.au_id AS `AUTHOR ID`, 
       authors.au_lname AS `LAST NAME`, 
       authors.au_fname AS `FIRST NAME`,
       COALESCE(SUM(sales.qty), 0) AS `TOTAL`
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY `AUTHOR ID`, `LAST NAME`, `FIRST NAME`
ORDER BY `TOTAL` DESC
LIMIT 3;


/* Challenge 4 */

SELECT DISTINCT authors.au_id AS `AUTHOR ID`, 
		authors.au_lname AS `LAST NAME`, 
		authors.au_fname AS `FIRST NAME`,
		COALESCE(SUM(sales.qty), 0) AS `TOTAL`

FROM authors INNER JOIN titleauthor 
	ON authors.au_id = titleauthor.au_id
	INNER JOIN sales
	ON titleauthor.title_id = sales.title_id 
    GROUP BY `AUTHOR ID` 
    ORDER BY `TOTAL` DESC 
    LIMIT 23;
        

