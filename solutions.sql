-- Challenge 1 solution
SELECT authors.au_id, authors.au_lname, authors.au_fname,
titles.title, publishers.pub_name

FROM authors, titles, publishers, titleauthor

WHERE authors.au_id == titleauthor.au_id AND
titleauthor.title_id == titles.title_id AND
titles.pub_id == publishers.pub_id
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
