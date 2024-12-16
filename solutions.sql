/*
Challenge 1 - Who Have Published What At Where?
In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author 
has published at which publishers. Your output should have at least the following columns:

AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published
*/
SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
FROM authors a
join titleauthor ta on a.au_id = ta.au_id
join titles t on ta.title_id = t.title_id
join publishers p on t.pub_id = p.pub_id
order by a.au_id asc, t.title desc;

/*
Challenge 2
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.
*/
SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, count(t.title)
from authors a
join titleauthor ta on a.au_id = ta.au_id
join titles t on ta.title_id = t.title_id
join publishers p on t.pub_id = p.pub_id
group by a.au_id, a.au_lname, a.au_fname, p.pub_name
order by a.au_id desc, count(t.title)desc;

/*
Challenge 3 - Best Selling Authors
Who are the top 3 authors who have sold the highest number of titles? 
Write a query to find out.

Requirements:

Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.
*/
SELECT a.au_id, a.au_lname, a.au_fname, count(t.title)
from authors a
join titleauthor ta on a.au_id = ta.au_id
join titles t on ta.title_id = t.title_id
group by a.au_id, a.au_lname, a.au_fname
order by count(t.title)desc limit 3;

/*
Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
Also order your results based on TOTAL from high to low.
*/
SELECT a.au_id, a.au_lname, a.au_fname, count(t.title)
from authors a
left join titleauthor ta on a.au_id = ta.au_id
left join titles t on ta.title_id = t.title_id
group by a.au_id, a.au_lname, a.au_fname
order by count(t.title) desc limit 23;