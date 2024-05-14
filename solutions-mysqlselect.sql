USE publications;

/* Challenge #1 */
SELECT 
	au.au_id as author_id,
    au_fname as last_name,
    au_lname as first_name,
    title,
    pub_name as publisher_name
FROM authors as au
	inner join titleauthor as ta on au.au_id = ta.au_id 
    inner join titles tt on ta.title_id = tt.title_id 
    inner join publishers pub on tt.pub_id = pub.pub_id;
    
/*Challenge #2 */
Select 
	au.au_id as 'Author ID',
    au_lname as 'Last Name',
    au_fname as 'First Name',
    pub_name as 'Publisher',
	title, 
    COUNT(distinct tt.title_id ) as 'Title Count' 
FROM authors as au
	inner join titleauthor as ta on au.au_id = ta.au_id 
    inner join titles tt on ta.title_id = tt.title_id 
    inner join publishers pub on tt.pub_id = pub.pub_id
group by au.au_id, au_fname, au_lname, pub_name, title;

select *
from titles as tt ;

/* Checking if a title can have multiple authors */
select * 
from titleauthor as tau
where tau.title_id = 'PS2091';

/*Challenge #3 */
Select 
	au.au_id as 'Author ID',
    au_lname as 'Last Name',
    au_fname as 'First Name',
    SUM(ss.qty) as 'Total'
FROM authors as au
	inner join titleauthor as ta on au.au_id = ta.au_id 
    inner join titles tt on ta.title_id = tt.title_id 
    inner join sales ss on tt.title_id = ss.title_id
group by au.au_id, au_fname, au_lname
ORDER BY SUM(ss.qty) DESC
Limit 3;

/* Challenge 4 */ 
Select 
	au.au_id as 'Author ID',
    au_lname as 'Last Name',
    au_fname as 'First Name',
    SUM(ss.qty) as 'Total'
FROM authors as au
	left join titleauthor as ta on au.au_id = ta.au_id 
    left join titles tt on ta.title_id = tt.title_id 
    left join sales ss on tt.title_id = ss.title_id
group by au.au_id, au_fname, au_lname
ORDER BY SUM(ss.qty) DESC;
