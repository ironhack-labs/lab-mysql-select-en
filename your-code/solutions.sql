#select * from publication.authors;
#select * from publication.discounts;
#select * from publication.employee;
#select * from publication.jobs;
#select * from publication.pub_info;
#select * from publication.publishers;
#select * from publication.roysched;
#select * from publication.sales;
#select * from publication.stores;
#select * from publication.titleauthor;
#select * from publication.titles;
use publication;
#SHOW TABLES IN publication;

#Challege 1
SELECT #which columns should appear in the output
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    t.title AS "TITLE",
    p.pub_name AS "PUBLISHER"
FROM 
    publication.authors a # main table to start getting data
JOIN 
    publication.titleauthor ta ON a.au_id = ta.au_id #Links the authors table to the titleauthor table using the au_id column (common in both tables)
JOIN 
    publication.titles t ON ta.title_id = t.title_id #Links the titleauthor table to the titles table using the title_id column
JOIN 
    publication.publishers p ON t.pub_id = p.pub_id #Links the titles table to the publishers table using the pub_id column
ORDER BY 
    a.au_id ASC, t.title, p.pub_name;# how the rows in the result are sorted

#Challege 2
SELECT #which columns should appear in the output
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    count(t.title) AS "TITLE COUNT"
FROM
	publication.authors a 
JOIN 
    publication.titleauthor ta ON a.au_id = ta.au_id
JOIN 
    publication.titles t ON ta.title_id = t.title_id
JOIN 
    publication.publishers p ON t.pub_id = p.pub_id 
GROUP BY 
    a.au_id, a.au_lname, a.au_fname, p.pub_name# define how rows are grouped before counting.
ORDER BY 
    a.au_id DESC;

#Challege 3
SELECT #which columns should appear in the output
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
	SUM(t.ytd_sales) AS "TOTAL"# adds together the total sold titles
FROM 
    publication.authors a
JOIN 
    publication.titleauthor ta ON a.au_id = ta.au_id
JOIN 
    publication.titles t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    SUM(t.ytd_sales) DESC
LIMIT 3;

#Challege 4
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
	COALESCE(SUM(t.ytd_sales), 0) AS "TOTAL"#ensures that NULL values are replaced with 0, so authors with no sales get a total of 0
FROM 
    publication.authors a
LEFT JOIN # ensures all authors are included, even if they have no sales
    publication.titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN # ensures all authors are included, even if they have no sales
    publication.titles t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    SUM(t.ytd_sales) DESC