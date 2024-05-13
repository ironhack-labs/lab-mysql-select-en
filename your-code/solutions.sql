-- Challenge 1   
select distinct 
	ta.au_id as author_id, 
    aut.au_lname as last_name,
    aut.au_fname as first_name,
	tit.title as title,
    pub.pub_name as publisher
from publications.titleauthor ta
	left join publications.authors aut on aut.au_id = ta.au_id
    left join publications.titles tit on tit.title_id = ta.title_id
    left join publications.publishers pub on pub.pub_id = tit.pub_id
order by ta.au_id asc

-- Challenge 2
select distinct 
	ta.au_id as author_id, 
    aut.au_lname as last_name,
    aut.au_fname as first_name,
    pub.pub_name as publisher,
    count(tit.title) as title_count
from publications.titleauthor ta
	left join publications.authors aut on aut.au_id = ta.au_id
    left join publications.titles tit on tit.title_id = ta.title_id
    left join publications.publishers pub on pub.pub_id = tit.pub_id
group by pub.pub_name, ta.au_id, aut.au_lname, aut.au_fname
order by ta.au_id desc

-- Challenge 3
select distinct 
	ta.au_id as author_id, 
    aut.au_lname as last_name,
    aut.au_fname as first_name,
    sum(sa.qty) as total
from publications.titleauthor ta
	left join publications.authors aut on aut.au_id = ta.au_id
    left join publications.titles tit on tit.title_id = ta.title_id
    left join publications.sales sa on sa.title_id = ta.title_id
group by sa.title_id, aut.au_lname, aut.au_fname, ta.au_id
order by total desc
limit 3

-- Challenge 4
select distinct 
	ta.au_id as author_id, 
    aut.au_lname as last_name,
    aut.au_fname as first_name,
    ifnull(sum(sa.qty),0) as total
from publications.titleauthor ta
	left join publications.authors aut on aut.au_id = ta.au_id
    left join publications.titles tit on tit.title_id = ta.title_id
    left join publications.sales sa on sa.title_id = ta.title_id
group by sa.title_id, aut.au_lname, aut.au_fname, ta.au_id
order by total desc