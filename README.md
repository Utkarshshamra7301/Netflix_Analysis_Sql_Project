# Netflix_Analysis_Sql_Project
![image](https://github.com/user-attachments/assets/d87b84f6-a657-42a4-8c8a-2c0d495e93d4)

### This repository contains SQL queries designed to analyze a Netflix dataset. The dataset includes various details about Netflix content, such as title, director, cast, country, rating, duration, and more. Through this analysis, we aim to answer several business-related questions to gain insights into Netflix's content library.

### Database Schema
- The dataset is stored in a table called netflix with the following schema:

- show_id: Unique identifier for each show.
- type: Indicates whether the content is a movie or TV show.
- title: Title of the content.
- director: Director of the content (if available).
- casts: List of actors featured in the content.
- country: Country where the content was produced.
- date_added: The date when the content was added to Netflix.
- release_year: Year when the content was released.
- rating: Content rating (e.g., PG, R).
`duration`: Duration of the content (for TV shows, it shows the number of seasons).
- listed_in: Genre or categories in which the content is listed.
- description: A short summary of the content.
Key SQL Queries
Show All Data: Retrieve all the rows from the Netflix table.
Count Total Content: Find out the total number of entries in the dataset.
Distinct Types: Identify the different types of content (Movies vs. TV Shows).
Movies vs. TV Shows: Count the number of movies vs. TV shows.
Most Common Rating: Determine the most common rating for movies and TV shows.
Movies Released in 2020: List all movies released in the year 2020.
Top 5 Countries by Content: Identify the top 5 countries producing the most content.
Longest Movie: Find the longest movie in terms of duration.
Content Added in the Last 5 Years: Find content added in the last five years.
Movies Directed by Rajiv Chilaka: List all movies and TV shows directed by Rajiv Chilaka.
TV Shows with More Than 5 Seasons: Find TV shows with more than five seasons.
Count Content in Each Genre: Count the number of content items in each genre.
Content Releases in India: Analyze the average number of content releases in India over the years.
Documentaries: List all the movies that are documentaries.
Content Without Director: Identify all content entries that don't have a listed director.
Movies Featuring Salman Khan in the Last 10 Years: Find how many movies Salman Khan has appeared in the last 10 years.
Top 10 Actors in Indian Movies: Identify the top 10 actors who have appeared in the most Indian movies.
Categorize Content by Keywords: Classify content based on the presence of keywords like "kill" or "violence" in the description, labeling them as "bad" or "good."
Conclusion
This analysis helps understand Netflix's content distribution, popular ratings, and specific trends like the most common genres, top actors, and more. It also demonstrates how SQL can be used to solve real-world business problems in the context of media streaming.

Created by: Utkarsh Sharma
