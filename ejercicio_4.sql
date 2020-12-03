USE FilmStaging;

--1. ¿Cuál es la sinopsis de la película ‘Star Wars: Episode III - Revenge of the Sith’? 
-- Devuelve el resultado en mayúsculas.
SELECT FilmSynopsis
FROM Film
WHERE FilmName = 'Star Wars: Episode III - Revenge of the Sith'

-- 2. Obtén un listado de todas las películas que contengan la palabra ‘Harry’ en el título
SELECT FilmId, FilmName
FROM Film
WHERE FilmName LIKE '%Harry%'

-- 3. Obtén todas las películas cuya fecha de lanzamiento comprenda entre el 1 de enero del 2000 
-- y el 31 de diciembre del 2000. Ordénalas alfabéticamente de manera inversa 
-- (los nombres que empiezan por la letra Z deberán aparecer en primer lugar).
SELECT FilmId, FilmName, FilmReleaseDate
FROM Film
WHERE FilmReleaseDate <= '2020/01/01' AND FilmReleaseDate >= '2000/12/31' 
ORDER BY FilmName DESC

-- 4. Obtén todos los actores y actrices que hayan interpretado un papel en una película que
-- haya ganado más de 10 Oscar, así como el personaje que interpretaron en cada una de las películas

