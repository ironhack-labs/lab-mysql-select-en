SELECT * FROM publications.titleauthor;

## Challenge 1 - Who Have Published What At Where? In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:
/*AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published*/
SELECT 
    authors.au_id AS 'AUTHOR ID', 
    authors.au_lname AS 'LAST NAME', 
    authors.au_fname AS 'FIRST NAME', 
    titles.title AS 'TITLE', 
    publishers.pub_name AS 'PUBLISHER'
FROM 
    authors
JOIN 
    titleauthor ON authors.au_id = titleauthor.au_id
JOIN 
    titles ON titleauthor.title_id = titles.title_id
JOIN 
    publishers ON titles.pub_id = publishers.pub_id;
    
    ## Challenge 2 - Who Have Published How Many At Where? Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher
    SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    publishers.pub_name AS 'PUBLISHER',
    COUNT(titles.title_id) AS 'TITLE COUNT'
FROM 
    authors
JOIN 
    titleauthor ON authors.au_id = titleauthor.au_id
JOIN 
    titles ON titleauthor.title_id = titles.title_id
JOIN 
    publishers ON titles.pub_id = publishers.pub_id
GROUP BY 
    authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
ORDER BY 
    authors.au_id, publishers.pub_name;
    -- validate the sum of the TITLE COUNT column and compare it to the total number of records in the titleauthor table
    SELECT SUM(TITLE_COUNT) AS TOTAL_TITLE_COUNT
FROM (
    SELECT 
        COUNT(title_id) AS TITLE_COUNT
    FROM 
        titleauthor
    GROUP BY 
        au_id, title_id
) AS COUNTS;

## Challenge 3 - Best Selling Authors
/* Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
Requirements:
Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.*/
SELECT 
    authors.au_id AS 'AUTHOR ID', 
    authors.au_lname AS 'LAST NAME', 
    authors.au_fname AS 'FIRST NAME', 
    SUM(sales.qty) AS 'TOTAL'
FROM 
    publications.authors
JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
join  publications.sales ON titleauthor.title_id = sales.title_id
GROUP BY 
    authors.au_id, authors.au_lname, authors.au_fname
ORDER BY 
    SUM(sales.qty) DESC
LIMIT 3;


## Challenge 4 - Best Selling Authors Ranking Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.
SELECT 
    authors.au_id AS 'AUTHOR ID', 
    authors.au_lname AS 'LAST NAME', 
    authors.au_fname AS 'FIRST NAME', 
    ifnull(SUM(sales.qty), 0) AS 'TOTAL'
FROM 
    publications.authors
left join publications.titleauthor ON authors.au_id = titleauthor.au_id
left join  publications.sales ON titleauthor.title_id = sales.title_id
GROUP BY 
    authors.au_id, authors.au_lname, authors.au_fname
ORDER BY 
    SUM(sales.qty) DESC
