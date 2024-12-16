--- Challenge 1
select a.au_id 'AUTHOR ID', a.au_lname 'LAST NAME', a.au_fname 'FIRST NAME',
       t.title 'TITLE', p.pub_name 'PUBLISHER'
from authors a
join titleauthor ta on a.au_id = ta.au_id
join titles t on ta.title_id = t.title_id
join publishers p on t.pub_id = p.pub_id
order by a.au_id asc, t.title desc;

--- Challenge 2
select a.au_id 'AUTHOR ID', a.au_lname 'LAST NAME', a.au_fname 'FIRST NAME',
        p.pub_name 'PUBLISHER', count(t.title) 'TITLE COUNT'
from authors a
join titleauthor ta on a.au_id = ta.au_id
join titles t on ta.title_id = t.title_id
join publishers p on t.pub_id = p.pub_id
group by a.au_id, a.au_lname, a.au_fname,
        p.pub_name
order by  a.au_id desc,  count(t.title) desc

--- Challenge 3
select a.au_id 'AUTHOR ID', a.au_lname 'LAST NAME', a.au_fname 'FIRST NAME',
         sum(sales.qty) AS 'TOTAL'
from authors a
join titleauthor ta on a.au_id = ta.au_id
join titles t on ta.title_id = t.title_id
join sales on t.title_id = sales.title_id
group by a.au_id, a.au_lname, a.au_fname
order by sum(sales.qty) DESC
limit 3;

--- Challenge 4
select a.au_id 'AUTHOR ID', a.au_lname 'LAST NAME', a.au_fname 'FIRST NAME',
         ifnull(sum(sales.qty), 0) AS 'TOTAL'
from authors a
left join titleauthor ta on a.au_id = ta.au_id
left join titles t on ta.title_id = t.title_id
left join sales on t.title_id = sales.title_id    
group by a.au_id, a.au_lname, a.au_fname
order by ifnull(sum(sales.qty), 0) desc
limit 23;
