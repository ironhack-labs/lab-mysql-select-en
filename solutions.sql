-- Challenge 1 solution
SELECT authors.au_id, authors.au_lname, authors.au_fname,
titles.title, publishers.pub_name

FROM authors, titles, publishers, titleauthor

WHERE authors.au_id == titleauthor.au_id AND
titleauthor.title_id == titles.title_id AND
titles.pub_id == publishers.pub_id
;

-- Challenge 2 solution
SELECT authors.au_id, authors.au_lname, authors.au_fname,
 publishers.pub_name, count(titles.title_id) AS title_count

FROM authors, titles, publishers, titleauthor

WHERE authors.au_id == titleauthor.au_id AND
titleauthor.title_id == titles.title_id AND
titles.pub_id == publishers.pub_id

GROUP by authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
ORDER by count(titles.title_id) DESC, authors.au_id DESC
;

-- Challenge 3 solution
SELECT authors.au_id, authors.au_lname, authors.au_fname,
 sum(sales.qty) AS Total

 FROM authors, sales, titleauthor

 WHERE authors.au_id == titleauthor.au_id AND
 titleauthor.title_id == sales.title_id

 GROUP by authors.au_id, authors.au_lname, authors.au_fname
 ORDER by Total DESC, authors.au_id DESC
 LIMIT 3 
;

-- Challenge 4 solution
SELECT authors.au_id, authors.au_lname, authors.au_fname,
 coalesce(sum(sales.qty),0) AS Total

 FROM authors
 LEFT JOIN titleauthor on authors.au_id == titleauthor.au_id
 LEFT JOIN sales on titleauthor.title_id == sales.title_id

 GROUP by authors.au_id, authors.au_lname, authors.au_fname
 ORDER by Total DESC
;

