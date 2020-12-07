USE FilmStaging;


--1. �Cu�l es la sinopsis de la pel�cula �Star Wars: Episode III - Revenge of the Sith�? 
-- Devuelve el resultado en may�sculas.

SELECT UPPER(CONVERT(VARCHAR(MAX), FilmSynopsis))
FROM Film
WHERE FilmName = 'Star Wars: Episode III - Revenge of the Sith'


-- 2. Obt�n un listado de todas las pel�culas que contengan la palabra �Harry� en el t�tulo

SELECT FilmId, FilmName
FROM Film
WHERE FilmName LIKE '%Harry%'


-- 3. Obt�n todas las pel�culas cuya fecha de lanzamiento comprenda entre el 1 de enero del 2000 
-- y el 31 de diciembre del 2000. Ord�nalas alfab�ticamente de manera inversa

SELECT FilmId, FilmName, FilmReleaseDate
FROM Film
WHERE FilmReleaseDate <= '2020/01/01' AND FilmReleaseDate >= '2000/12/31' 
ORDER BY FilmName DESC


-- 4. Obt�n todos los actores y actrices que hayan interpretado un papel en una pel�cula que
-- haya ganado m�s de 10 Oscar, as� como el personaje que interpretaron en cada una de las pel�culas

SELECT A.ActorId, A.ActorName, C.CastCharacterName, F.FilmName, F.FilmOscarWins
FROM Actor A INNER JOIN [Cast] C ON A.ActorId = C.ActorId INNER JOIN Film F ON C.FilmId = F.FilmId
WHERE F.FilmOscarWins >= 10


-- 5. �Cu�l fue el presupuesto del estudio �Universal Pictures� en el a�o 2007?

SELECT F.StudioId, S.StudioName, SUM(F.FilmBudgetDollars) AS StudioBudgetDollars
FROM  Film F INNER JOIN Studio S ON F.StudioId = S.StudioId 
WHERE S.StudioName = 'Universal Pictures' AND YEAR(F.FilmReleaseDate) = 2007
GROUP BY F.StudioId, S.StudioName


-- 6. Calcula la media de duraci�n de las pel�culas dirigidas por �Steven Spielberg�.

SELECT D.DirectorName, AVG(F.FilmRunTimeMinutes) AS FilmRunTimeMinutes
FROM Film F INNER JOIN Director D ON F.DirectorId = D.DirectorId
WHERE D.DirectorName = 'Steven Spielberg'
GROUP BY D.DirectorId, D.DirectorName


-- 7. Obt�n un listado con todos los directores que hayan dirigido m�s de 5 pel�culas.

SELECT D.DirectorName, COUNT(*) AS FilmCount
FROM Film F INNER JOIN Director D ON F.DirectorId = D.DirectorId
GROUP BY D.DirectorId, D.DirectorName
HAVING COUNT(*) > 5


-- 8. Obt�n al director que haya dirigido la pel�cula nominada a los Oscar m�s veces.

SELECT TOP 1 D.DirectorName, F.FilmName, F.FilmOscarNominations
FROM Film F INNER JOIN Director D ON F.DirectorId = D.DirectorId
ORDER BY F.FilmOscarNominations DESC


-- 9. Obt�n un listado con todas las pel�culas y su certificado correspondiente. 
-- Elimina del resultado todas aquellas que no tengan un certificado establecido.

SELECT F.FilmId, F.FilmName, C.CertificateId
FROM Film F LEFT JOIN [Certificate] C ON F.CertificateId = C.CertificateId

SELECT F.FilmId, F.FilmName, C.CertificateId
FROM Film F LEFT JOIN [Certificate] C ON F.CertificateId = C.CertificateId
WHERE F.CertificateId IS NOT NULL

-- 10. Calcula la diferencia de presupuesto entre los estudios �20th Century Fox� y
--�Dreamworks�.

SELECT (SELECT SUM(F.FilmBudgetDollars) AS StudioBudgetDollars
FROM  Film F INNER JOIN Studio S ON F.StudioId = S.StudioId 
WHERE S.StudioName = '20th Century Fox'
GROUP BY F.StudioId, S.StudioName)
-
(SELECT SUM(F.FilmBudgetDollars) AS StudioBudgetDollars
FROM  Film F INNER JOIN Studio S ON F.StudioId = S.StudioId 
WHERE S.StudioName = 'Dreamworks'
GROUP BY F.StudioId, S.StudioName) AS Difference


