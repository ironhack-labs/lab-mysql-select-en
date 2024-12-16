SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    COUNT(*) AS "TOTAL"
FROM 
    titleauthor ta
JOIN 
    authors a ON ta.au_id = a.au_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    TOTAL DESC
LIMIT 3;
