SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    IFNULL(COUNT(ta.title_id), 0) AS "TOTAL"
FROM 
    authors a
LEFT JOIN 
    titleauthor ta ON a.au_id = ta.au_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    TOTAL DESC;
