USE FilmStaging;

--1. �Cu�l es la sinopsis de la pel�cula �Star Wars: Episode III - Revenge of the Sith�? 
-- Devuelve el resultado en may�sculas.
SELECT FilmSynopsis
FROM Film
WHERE FilmName = 'Star Wars: Episode III - Revenge of the Sith'

-- 2. Obt�n un listado de todas las pel�culas que contengan la palabra �Harry� en el t�tulo
SELECT FilmId, FilmName
FROM Film
WHERE FilmName LIKE '%Harry%'

-- 3. Obt�n todas las pel�culas cuya fecha de lanzamiento comprenda entre el 1 de enero del 2000 
-- y el 31 de diciembre del 2000. Ord�nalas alfab�ticamente de manera inversa 
-- (los nombres que empiezan por la letra Z deber�n aparecer en primer lugar).
SELECT FilmId, FilmName, FilmReleaseDate
FROM Film
WHERE FilmReleaseDate <= '2020/01/01' AND FilmReleaseDate >= '2000/12/31' 
ORDER BY FilmName DESC

-- 4. Obt�n todos los actores y actrices que hayan interpretado un papel en una pel�cula que
-- haya ganado m�s de 10 Oscar, as� como el personaje que interpretaron en cada una de las pel�culas

