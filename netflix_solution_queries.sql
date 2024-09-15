CREATE TABLE netflix
(
	show_id	VARCHAR(5),
	type    VARCHAR(10),
	title	VARCHAR(250),
	director VARCHAR(550),
	casts	VARCHAR(1050),
	country	VARCHAR(550),
	date_added	VARCHAR(55),
	release_year	INT,
	rating	VARCHAR(15),
	duration	VARCHAR(15),
	listed_in	VARCHAR(250),
	description VARCHAR(550)
);
-- To show all the database
SELECT * 
FROM netflix;
-- To know how many number of rows are there in the dataset.
SELECT COUNT(*) AS Total_content
FROM netflix;

-- To find how many type of content we have in netflix.
SELECT 
	DISTINCT(type)
FROM netflix;

-- 15 Business Problems......

-- 1. Count the number of movies Vs Tv shows.
SELECT 
	type,COUNT(*) AS no_of_movies
FROM netflix
	GROUP BY type;
	
-- 2.Find the most comman rating for movies and tv shows.
SELECT
	type,
	rating
FROM (SELECT 
	type,
	rating,
	COUNT(*) as total_count,
	RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
FROM netflix
GROUP BY 1,2) as t1
WHERE ranking=1;

-- 3. List all movies released in a specific year e.g(2020)
SELECT 
	* 
FROM netflix
WHERE type='Movie' AND release_year=2020;

-- 4.Find the top 5 countries with the most content on netflix.
SELECT
	UNNEST(STRING_TO_ARRAY(country,',')) AS new_country,
	COUNT(show_id) AS total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- 5.Identify the longest movie ?
SELECT 
	* 
FROM netflix
	WHERE type='Movie'
	AND
	duration = (SELECT MAX(duration) FROM netflix);

-- 6. Find content added in the last five years.
SELECT 
	*
	FROM netflix
	WHERE TO_Date(date_added,'month DD YYYY') >= CURRENT_DATE - INTERVAL '5 years';

-- 7. Find all the movies and Tv shows directed by 'RajivChilaka'

SELECT * FROM netflix
	WHERE director LIKE '%Rajiv Chilaka%';

-- 8. List all Tv shows with more than 5 seasons.
SELECT 
	*
	FROM netflix
	WHERE type = 'TV Show'
	AND
	SPLIT_PART(duration,' ',1)::numeric >5
;

-- 9. Count the number of content items in each genre.
SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in,',')) AS Genre,
	COUNT(show_id)
	FROM netflix
	GROUP BY 1;

-- 10. Find each year and the avg number of content release in India  on netflix .
-- return top 5 year with highest avg content release 
SELECT 
	EXTRACT(YEAR FROM TO_DATE(date_added , 'Month DD YYYY')) AS year,
	COUNT(*) AS count_of_content,
	ROUND(COUNT(*)::numeric/(SELECT COUNT(*) FROM netflix WHERE country = 'India')::numeric* 100,2) AS Avg_count
	FROM netflix
	WHERE country = 'India'
	GROUP BY 1;

-- 11. List all the movies that are documentries.
SELECT 
	*
	FROM netflix
	WHERE listed_in ILIKE '%documentaries%'

-- 12. Find all the content without a director
SELECT * FROM netflix
WHERE director IS NULL;

-- 13. Find how many movies actor 'Salman Khan ' appeared in last 10 Years ? 
SELECT * FROM netflix
WHERE casts ILIKE '%Salman Khan%'
AND
release_year > EXTRACT(YEAR FROM CURRENT_DATE) -10

-- 14. Find the top 10 actors who have appeared the highest number of movies produced in India.
SELECT 
	UNNEST(STRING_TO_ARRAY(casts,',')) AS actors,
	COUNT(*)
	FROM netflix
	WHERE country = 'India'
	GROUP BY actors
	ORDER BY COUNT(*) DESC
	LIMIT 10;

-- 15. Categorized the content based on presense of the keywords 'kill' and 'violence' in description field. Label content containing these keywords as 'bad' and all other content as 'good'.
-- Count how many items fall into each category.

WITH new_table AS

(SELECT 
	*,
	CASE 
	WHEN 
	description ILIKE '%kill%' OR
	description ILIKE '%violence%' THEN 'Bad'
	ELSE 'Good'
	END AS Review	

	FROM netflix)

SELECT 
	Review,
	COUNT(*)
	FROM new_table
	GROUP BY 1
 -- Created BY UTKARSH SHARMA
	