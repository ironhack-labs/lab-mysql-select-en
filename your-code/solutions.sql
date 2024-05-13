use publications_local;

/* Challenge 1 */

select authors.au_id as `AUTHOR ID`, 
authors.au_lname as `LAST NAME`, 
authors.au_fname as `FIRST NAME`,
titles.title as TITLE,
publishers.pub_name as PUBLISHER

from authors inner join titleauthor 
	on authors.au_id = titleauthor.au_id
     inner join titles
		on titleauthor.title_id = titles.title_id
        inner join publishers
        on titles.pub_id = publishers.pub_id  order by `AUTHOR ID`;

/* Challenge 2 */

select authors.au_id as `AUTHOR ID`, 
authors.au_lname as `LAST NAME`, 
authors.au_fname as `FIRST NAME`,
publishers.pub_name as PUBLISHER,
count(titles.title) as `TITLE COUNT`


from authors inner join titleauthor 
	on authors.au_id = titleauthor.au_id
     inner join titles
		on titleauthor.title_id = titles.title_id
        inner join publishers
        on titles.pub_id = publishers.pub_id GROUP BY PUBLISHER, `AUTHOR ID` order by`AUTHOR ID` DESC, `TITLE COUNT` DESC;
        
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

select DISTINCT authors.au_id as `AUTHOR ID`, 
authors.au_lname as `LAST NAME`, 
authors.au_fname as `FIRST NAME`,
COALESCE(SUM(sales.qty), 0) as `TOTAL`

from authors inner join titleauthor 
	on authors.au_id = titleauthor.au_id
     inner join sales
		on titleauthor.title_id = sales.title_id GROUP BY `AUTHOR ID` order by `TOTAL` desc limit 23;