#1. What are the names of all movies released in 1995?
SELECT name FROM `movies` WHERE year=1995

#2. How many people played a part in the movie "Lost in Translation"?
SELECT COUNT(*) from roles where movie_id in(SELECT id from movies where name="Lost in Translation")

#3. What are the names of all the people who played a part in the movie "Lost in Translation"?
SELECT first_name,last_name FROM roles A LEFT JOIN actors B ON A.actor_id = B.id

#4. Who directed the movie "Fight Club"?
SELECT first_name,last_name FROM directors WHERE directors.id in (SELECT director_id FROM movies_directors WHERE movies_directors.movie_id in (SELECT id FROM movies WHERE name="Fight Club"))

#5. How many movies has Clint Eastwood directed?
SELECT COUNT(*) from movies_directors where director_id in (SELECT id FROM directors WHERE first_name="Clint" AND last_name="Eastwood")

#6. What are the names of all movies Clint Eastwood has directed?
SELECT name FROM movies WHERE id in (SELECT movie_id from movies_directors where director_id in (SELECT id FROM directors WHERE first_name="Clint" AND last_name="Eastwood"))

#7. What are the names of all directors who have directed at least one horror lm?
SELECT first_name, last_name from directors where id in(SELECT director_id FROM directors_genres WHERE genre="Horror")

#8. What are the names of every actor who has appeared in a movie directed by Christopher Nolan?
SELECT first_name, last_name FROM actors where id IN(SELECT actor_id from roles where movie_id in(SELECT movie_id FROM movies_directors where director_id in(SELECT id FROM directors where first_name="Christopher" and last_name="Nolan")))