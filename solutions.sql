-- Challenge 1: Who Have Published What At Where?
-- Objective: Write a MySQL SELECT query that joins various tables to figure out
-- what titles each author has published at which publishers.

-- Required Columns:
-- 1. AUTHOR ID - the ID of the author (from authors table)
-- 2. LAST NAME - author last name
-- 3. FIRST NAME - author first name
-- 4. TITLE - name of the published title (from titles table)
-- 5. PUBLISHER - name of the publisher where the title was published (from publishers table)

-- Table Relationships:
-- - authors.au_id = titleauthor.au_id
-- - titleauthor.title_id = titles.title_id
-- - titles.pub_id = publishers.pub_id

SELECT 
    authors.au_id AS `AUTHOR ID`,        -- Author ID from the authors table
    authors.au_lname AS `LAST NAME`,     -- Author's Last Name from the authors table
    authors.au_fname AS `FIRST NAME`,    -- Author's First Name from the authors table
    titles.title AS `TITLE`,             -- Title of the book from the titles table
    publishers.pub_name AS `PUBLISHER`   -- Publisher's Name from the publishers table
FROM 
    authors                              -- Start with the authors table
JOIN 
    titleauthor                          -- Join with the titleauthor table
    ON authors.au_id = titleauthor.au_id -- Match author IDs between authors and titleauthor
JOIN 
    titles                               -- Join with the titles table
    ON titleauthor.title_id = titles.title_id -- Match title IDs between titleauthor and titles
JOIN 
    publishers                           -- Join with the publishers table
    ON titles.pub_id = publishers.pub_id; -- Match publisher IDs between titles and publishers

-- Note: If the query is correct, the total rows in your output should equal
-- the total number of records in the titleauthor table.

-- Total Number of Records in titleauthor

SELECT COUNT(*) AS total_records
FROM titleauthor;

-- Total Number of Rows from Challenge 1 Query 

SELECT COUNT(*) AS total_output_rows
FROM (
    SELECT 
        authors.au_id AS `AUTHOR ID`, 
        authors.au_lname AS `LAST NAME`, 
        authors.au_fname AS `FIRST NAME`, 
        titles.title AS `TITLE`, 
        publishers.pub_name AS `PUBLISHER`
    FROM 
        authors
    JOIN 
        titleauthor ON authors.au_id = titleauthor.au_id
    JOIN 
        titles ON titleauthor.title_id = titles.title_id
    JOIN 
        publishers ON titles.pub_id = publishers.pub_id
) AS subquery;


-- Challenge 2: Who Have Published How Many At Where?
-- Objective: Count the number of titles each author has published at each publisher.

-- Required Columns:
-- 1. AUTHOR ID - Author's ID (from authors table)
-- 2. LAST NAME - Author's last name (from authors table)
-- 3. FIRST NAME - Author's first name (from authors table)
-- 4. PUBLISHER - Publisher's name (from publishers table)
-- 5. TITLE COUNT - Total number of titles published by the author at the publisher.

SELECT 
    authors.au_id AS `AUTHOR ID`,        -- Author ID
    authors.au_lname AS `LAST NAME`,     -- Author's Last Name
    authors.au_fname AS `FIRST NAME`,    -- Author's First Name
    publishers.pub_name AS `PUBLISHER`,  -- Publisher Name
    COUNT(titles.title_id) AS `TITLE COUNT` -- Count of titles published
FROM 
    authors                              -- Start with the authors table
JOIN 
    titleauthor                          -- Join titleauthor to connect authors to titles
    ON authors.au_id = titleauthor.au_id -- Match author IDs
JOIN 
    titles                               -- Join titles to get title and publisher details
    ON titleauthor.title_id = titles.title_id -- Match title IDs
JOIN 
    publishers                           -- Join publishers to get publisher names
    ON titles.pub_id = publishers.pub_id -- Match publisher IDs
GROUP BY 
    authors.au_id,                       -- Group by Author ID
    authors.au_lname,                    -- Group by Author Last Name
    authors.au_fname,                    -- Group by Author First Name
    publishers.pub_name;                 -- Group by Publisher Name

-- Note: The sum of the TITLE COUNT column should match the total number of records 
-- in the titleauthor table if your query is correct.

-- Total Number of Records in titleauthor

SELECT COUNT(*) AS total_records
FROM titleauthor;

-- Sum of the Title Count from Challenge 2 Query

SELECT SUM(title_count) AS total_title_count
FROM (
    SELECT 
        authors.au_id AS `AUTHOR ID`,
        authors.au_lname AS `LAST NAME`,
        authors.au_fname AS `FIRST NAME`,
        publishers.pub_name AS `PUBLISHER`,
        COUNT(titles.title_id) AS title_count
    FROM 
        authors
    JOIN 
        titleauthor ON authors.au_id = titleauthor.au_id
    JOIN 
        titles ON titleauthor.title_id = titles.title_id
    JOIN 
        publishers ON titles.pub_id = publishers.pub_id
    GROUP BY 
        authors.au_id, 
        authors.au_lname, 
        authors.au_fname, 
        publishers.pub_name
) AS subquery;


-- Challenge 3: Best Selling Authors
-- Objective: Find the top 3 authors who have sold the highest number of titles.

-- Required Columns:
-- 1. AUTHOR ID - Author's ID
-- 2. LAST NAME - Author's last name
-- 3. FIRST NAME - Author's first name
-- 4. TOTAL - Total number of titles sold

SELECT 
    authors.au_id AS `AUTHOR ID`,               -- Author's ID
    authors.au_lname AS `LAST NAME`,            -- Author's Last Name
    authors.au_fname AS `FIRST NAME`,           -- Author's First Name
    SUM(sales.qty) AS `TOTAL`                   -- Sum of quantity sold
FROM 
    authors                                     -- Start with authors table
JOIN 
    titleauthor ON authors.au_id = titleauthor.au_id -- Link authors to titles
JOIN 
    titles ON titleauthor.title_id = titles.title_id -- Link titles to sales
JOIN 
    sales ON titles.title_id = sales.title_id   -- Link sales to titles
GROUP BY 
    authors.au_id,                              -- Group by Author ID
    authors.au_lname,                           -- Group by Author Last Name
    authors.au_fname                            -- Group by Author First Name
ORDER BY 
    `TOTAL` DESC                                -- Sort in descending order of total titles sold
LIMIT 3;                                        -- Display only the top 3 authors


-- Challenge 4: Best Selling Authors Ranking
-- Objective: Display all 23 authors and their total number of titles sold, 
-- including those with 0 sales.

-- Required Columns:
-- 1. AUTHOR ID - Author's ID
-- 2. LAST NAME - Author's Last Name
-- 3. FIRST NAME - Author's First Name
-- 4. TOTAL - Total number of titles sold (0 for authors with no sales)

SELECT 
    authors.au_id AS `AUTHOR ID`,                -- Author's ID
    authors.au_lname AS `LAST NAME`,             -- Author's Last Name
    authors.au_fname AS `FIRST NAME`,            -- Author's First Name
    IFNULL(SUM(sales.qty), 0) AS `TOTAL`         -- Sum of titles sold; use 0 if NULL
FROM 
    authors                                      -- Start with authors table
LEFT JOIN 
    titleauthor ON authors.au_id = titleauthor.au_id -- Link authors to titles
LEFT JOIN 
    titles ON titleauthor.title_id = titles.title_id -- Link titles to sales
LEFT JOIN 
    sales ON titles.title_id = sales.title_id    -- Link sales to titles
GROUP BY 
    authors.au_id,                               -- Group by Author ID
    authors.au_lname,                            -- Group by Last Name
    authors.au_fname                             -- Group by First Name
ORDER BY 
    `TOTAL` DESC;                                -- Sort by total sold in descending order
