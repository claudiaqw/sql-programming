USE FilmStaging;

--1. �Cu�l es la sinopsis de la pel�cula �Star Wars: Episode III - Revenge of the Sith�? 
-- Devuelve el resultado en may�sculas.

/*La informaci�n sobre la sinopsis de una pel�cula se encuentra en la tabla Film
Para devolver el resultado en may�sculas se utiliza la funci�n UPPER. 
Fue necesario convertir el valor de la columna FilmSynopsis a VARCHAR para poder aplicar esta funci�n, 
la columna originalmente fue creada de tipo TEXT
*/

SELECT UPPER(CONVERT(VARCHAR(MAX), FilmSynopsis)) AS StarWarsSynopsis
FROM Film
WHERE FilmName = 'Star Wars: Episode III - Revenge of the Sith'


-- 2. Obt�n un listado de todas las pel�culas que contengan la palabra �Harry� en el t�tulo

/*Como la orden del ejercicio no especifica atributos, se muestran todos los atributos 
de cada pel�cula, que podemos encontrar en la tabla Film*/

SELECT *
FROM Film
WHERE FilmName LIKE '%Harry%'


-- 3. Obt�n todas las pel�culas cuya fecha de lanzamiento comprenda entre el 1 de enero del 2000 
-- y el 31 de diciembre del 2000. Ord�nalas alfab�ticamente de manera inversa

/*Como no se piden atributos espec�ficos se muestran todas las columnas de las filas de la 
tabla Film que cumplen dicha condici�n. De esta forma se puede comprobar que la fecha de lanzamiento 
se encuentra en el intervalo requerido*/

SELECT *
FROM Film
WHERE FilmReleaseDate >= '2000/01/01' AND FilmReleaseDate <= '2000/12/31' 
ORDER BY FilmName DESC


-- 4. Obt�n todos los actores y actrices que hayan interpretado un papel en una pel�cula que
-- haya ganado m�s de 10 Oscar, as� como el personaje que interpretaron en cada una de las pel�culas

/*
La informaci�n de los actores se encuentra en la tabla Actor. Para obtener los personajes 
interpretados es necesario hacer un JOIN con la tabla Cast.
*/

SELECT A.ActorId, A.ActorName, C.CastId, C.CastCharacterName
FROM Actor A INNER JOIN [Cast] C ON A.ActorId = C.ActorId INNER JOIN Film F ON C.FilmId = F.FilmId
WHERE F.FilmOscarWins > 10


-- 5. �Cu�l fue el presupuesto del estudio �Universal Pictures� en el a�o 2007?

/*El presupuesto de un determinado estudio se calcula sobre la base del presupuesto de todas
las pel�culas filmadas en ese estudio. Por esta raz�n es necesario realizar un JOIN entre las
tablas Film y Studio.Posteriormentese agrupa por estudio y se sumar el presupuesto de todas las 
pel�culas cuyo estudio tiene nombre �Universal Pictures�
*/

SELECT S.StudioName, SUM(F.FilmBudgetDollars) AS StudioBudgetDollars
FROM  Film F INNER JOIN Studio S ON F.StudioId = S.StudioId 
WHERE S.StudioName = 'Universal Pictures' AND YEAR(F.FilmReleaseDate) = 2007
GROUP BY F.StudioId, S.StudioName


-- 6. Calcula la media de duraci�n de las pel�culas dirigidas por �Steven Spielberg�.

/*Para conocer todas las pel�culas cuyo director es �Steven Spielberg� es necesario realizar un
JOIN entre las tablas Film y Director y filtrar las filas cuyo director tenga este nombre.
Para calcular la funci�n de agregaci�n AVG es necesario hacer un GROUP BY por director.
*/

SELECT D.DirectorName, AVG(F.FilmRunTimeMinutes) AS FilmRunTimeMinutes
FROM Film F INNER JOIN Director D ON F.DirectorId = D.DirectorId
WHERE D.DirectorName = 'Steven Spielberg'
GROUP BY D.DirectorId, D.DirectorName


-- 7. Obt�n un listado con todos los directores que hayan dirigido m�s de 5 pel�culas.

/*Para resolver esta consulta necesitamos contar la cantidad de pel�culas dirigidas por cada 
director. Para ello se aplica la funci�n de agregaci�n COUNT sobre los grupos creados por la 
operaci�n GROUP BY sobre los directores. 
Luego se aplica la condici�n utilizando HAVING pues es necesario aplicarla sobre cada uno de
los grupos.
*/

SELECT D.DirectorName, COUNT(*) AS FilmCount
FROM Film F INNER JOIN Director D ON F.DirectorId = D.DirectorId
GROUP BY D.DirectorId, D.DirectorName
HAVING COUNT(*) > 5


-- 8. Obt�n al director que haya dirigido la pel�cula nominada a los Oscar m�s veces.

/* La cantidad de veces que una pel�cula fue nominada a los premios Oscar se puede consultar en
la columna FilmOscarNominations de la tabla Film. Para obtener el nombre del director es necesario 
realizar un JOIN de las tablas Film y Director.
Las pel�culas se ordenan teniendo en cuenta la cantidad de nominaciones de mayor a menor, de manera
que la pel�cula con mayor cantidad de nominaciones se encuentra en la primera fila.
*/

SELECT TOP 1 D.DirectorId, D.DirectorName
FROM Film F INNER JOIN Director D ON F.DirectorId = D.DirectorId
ORDER BY F.FilmOscarNominations DESC


-- 9. Obt�n un listado con todas las pel�culas y su certificado correspondiente. 
-- Elimina del resultado todas aquellas que no tengan un certificado establecido.

/*En esta primera v�a se realiza un JOIN de las tablas Film y Certificate sobre la columna
CertificateId. El INNER JOIN solo se produce cuando las columnas tienen el mismo valor, por 
lo tanto las filas que tienen CertificateId = NULL en la tabla Film son descartadas.

*/
SELECT F.FilmId, F.FilmName, C.CertificateId
FROM Film F INNER JOIN [Certificate] C ON F.CertificateId = C.CertificateId

-- Otra v�a
/*Asimismo se puede realizar la operaci�n LEFT JOIN que mantiene todas las filas de Film,
aun cuando el CertificateId es NULL y luego aplicar un filtro para mantener las que son 
diferentes de NULL*/

SELECT F.FilmId, F.FilmName, C.CertificateId
FROM Film F LEFT JOIN [Certificate] C ON F.CertificateId = C.CertificateId
WHERE F.CertificateId IS NOT NULL

-- 10. Calcula la diferencia de presupuesto entre los estudios �20th Century Fox� y
--�Dreamworks�.

/*Esta consulta se puede dividir en tres partes:
1. El primer SELECT se encarga de calcular el presupuesto del estudio �20th Century Fox�
2. El segundo SELECT se encarga de calcular el presupuesto del estudio �Dreamworks�
(en ambos casos, para calcular el presupuesto de un estudio se utiliza la misma l�gica
del inciso 5)
3. El tercer SELECT se encarga de realizar la resta de los valores devueltos por las consultas
interiores y nombrar la columna respuesta Difference.
*/ 
SELECT  --3
(SELECT SUM(F.FilmBudgetDollars) AS StudioBudgetDollars  --1
FROM  Film F INNER JOIN Studio S ON F.StudioId = S.StudioId 
WHERE S.StudioName = '20th Century Fox'
GROUP BY F.StudioId, S.StudioName)
-
(SELECT SUM(F.FilmBudgetDollars) AS StudioBudgetDollars --2
FROM  Film F INNER JOIN Studio S ON F.StudioId = S.StudioId 
WHERE S.StudioName = 'Dreamworks'
GROUP BY F.StudioId, S.StudioName) AS Difference