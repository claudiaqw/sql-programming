USE FilmStaging;


--1. ¿Cuál es la sinopsis de la película ‘Star Wars: Episode III - Revenge of the Sith’? 
-- Devuelve el resultado en mayúsculas.

SELECT UPPER(CONVERT(VARCHAR(MAX), FilmSynopsis))
FROM Film
WHERE FilmName = 'Star Wars: Episode III - Revenge of the Sith'


-- 2. Obtén un listado de todas las películas que contengan la palabra ‘Harry’ en el título

SELECT FilmId, FilmName
FROM Film
WHERE FilmName LIKE '%Harry%'


-- 3. Obtén todas las películas cuya fecha de lanzamiento comprenda entre el 1 de enero del 2000 
-- y el 31 de diciembre del 2000. Ordénalas alfabéticamente de manera inversa

SELECT FilmId, FilmName, FilmReleaseDate
FROM Film
WHERE FilmReleaseDate <= '2020/01/01' AND FilmReleaseDate >= '2000/12/31' 
ORDER BY FilmName DESC


-- 4. Obtén todos los actores y actrices que hayan interpretado un papel en una película que
-- haya ganado más de 10 Oscar, así como el personaje que interpretaron en cada una de las películas

SELECT A.ActorId, A.ActorName, C.CastCharacterName, F.FilmName, F.FilmOscarWins
FROM Actor A INNER JOIN [Cast] C ON A.ActorId = C.ActorId INNER JOIN Film F ON C.FilmId = F.FilmId
WHERE F.FilmOscarWins >= 10


-- 5. ¿Cuál fue el presupuesto del estudio ‘Universal Pictures’ en el año 2007?

SELECT F.StudioId, S.StudioName, SUM(F.FilmBudgetDollars) AS StudioBudgetDollars
FROM  Film F INNER JOIN Studio S ON F.StudioId = S.StudioId 
WHERE S.StudioName = 'Universal Pictures' AND YEAR(F.FilmReleaseDate) = 2007
GROUP BY F.StudioId, S.StudioName


-- 6. Calcula la media de duración de las películas dirigidas por ‘Steven Spielberg’.

SELECT D.DirectorName, AVG(F.FilmRunTimeMinutes) AS FilmRunTimeMinutes
FROM Film F INNER JOIN Director D ON F.DirectorId = D.DirectorId
WHERE D.DirectorName = 'Steven Spielberg'
GROUP BY D.DirectorId, D.DirectorName


-- 7. Obtén un listado con todos los directores que hayan dirigido más de 5 películas.

SELECT D.DirectorName, COUNT(*) AS FilmCount
FROM Film F INNER JOIN Director D ON F.DirectorId = D.DirectorId
GROUP BY D.DirectorId, D.DirectorName
HAVING COUNT(*) > 5


-- 8. Obtén al director que haya dirigido la película nominada a los Oscar más veces.

SELECT TOP 1 D.DirectorName, F.FilmName, F.FilmOscarNominations
FROM Film F INNER JOIN Director D ON F.DirectorId = D.DirectorId
ORDER BY F.FilmOscarNominations DESC


-- 9. Obtén un listado con todas las películas y su certificado correspondiente. 
-- Elimina del resultado todas aquellas que no tengan un certificado establecido.

SELECT F.FilmId, F.FilmName, C.CertificateId
FROM Film F LEFT JOIN [Certificate] C ON F.CertificateId = C.CertificateId

SELECT F.FilmId, F.FilmName, C.CertificateId
FROM Film F LEFT JOIN [Certificate] C ON F.CertificateId = C.CertificateId
WHERE F.CertificateId IS NOT NULL

-- 10. Calcula la diferencia de presupuesto entre los estudios ‘20th Century Fox’ y
--‘Dreamworks’.

SELECT (SELECT SUM(F.FilmBudgetDollars) AS StudioBudgetDollars
FROM  Film F INNER JOIN Studio S ON F.StudioId = S.StudioId 
WHERE S.StudioName = '20th Century Fox'
GROUP BY F.StudioId, S.StudioName)
-
(SELECT SUM(F.FilmBudgetDollars) AS StudioBudgetDollars
FROM  Film F INNER JOIN Studio S ON F.StudioId = S.StudioId 
WHERE S.StudioName = 'Dreamworks'
GROUP BY F.StudioId, S.StudioName) AS Difference


