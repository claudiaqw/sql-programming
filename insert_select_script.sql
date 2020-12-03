use FilmStaging;

SET IDENTITY_INSERT Actor ON;

INSERT INTO Actor(ActorId, ActorName)
SELECT DISTINCT ActorId, ActorName  
FROM FilmStaging;

SET IDENTITY_INSERT Actor OFF;


SET IDENTITY_INSERT Director ON;

INSERT INTO Director(DirectorId,DirectorName)
SELECT DISTINCT DirectorId, DirectorName
FROM FilmStaging

SET IDENTITY_INSERT Director OFF;

