USE Exercise_4;

-- 4.1 Select the title of all movies.
SELECT M.title
FROM Movies M;

-- 4.2 Show all the distinct ratings in the database.
SELECT DISTINCT Rating
FROM Movies;

-- 4.3  Show all unrated movies.
SELECT * 
FROM movies
WHERE rating IS NULL;

-- 4.4 Select all movie theaters that are not currently showing a movie.
SELECT *
FROM MovieTheaters
WHERE Movie IS NULL;

-- 4.5 Select all data from all movie theaters  and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
SELECT T.*, M.*
FROM Theaters T LEFT JOIN Movies M 
ON T.movie = M.code;
    
-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
SELECT M.*, T.*
FROM Movies M LEFT JOIN Theaters T
ON T.movie = M.code;

-- 4.7 Show the titles of movies not currently being shown in any theaters.
SELECT title
FROM Movies
WHERE code NOT IN (
				   SELECT Movie
				   FROM Theaters
                   WHERE Movie IS NOT NULL
				 );

SELECT Movies.Title
FROM Theaters RIGHT JOIN Movies
ON Theaters.Movie = Movies.Code
WHERE Theaters.Movie IS NULL;

-- 4.8 Add the unrated movie "One, Two, Three".
INSERT INTO Movies VALUES(9, 'One, Two, Three',NULL);

-- 4.9 Set the rating of all unrated movies to "G".
UPDATE Movies
SET Rating = 'G'
WHERE Rating is null;

-- 4.10 Remove movie theaters projecting movies rated "NC-17".
DELETE FROM Theaters
