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

SET IDENTITY_INSERT [Certificate] ON; 
INSERT INTO [Certificate](CertificateId, [Certificate])
SELECT DISTINCT CertificateId, [Certificate]
FROM FilmStaging
WHERE CertificateId IS NOT NULL
SET IDENTITY_INSERT [Certificate] OFF;

SET IDENTITY_INSERT Country ON;
INSERT INTO Country(CountryId, CountryName)
SELECT DISTINCT CountryId, CountryName
FROM FilmStaging
SET IDENTITY_INSERT Country OFF;

SET IDENTITY_INSERT Studio ON;
INSERT INTO Studio(StudioId, StudioName)
SELECT DISTINCT FilmStudioId, StudioName
FROM FilmStaging
SET IDENTITY_INSERT Studio OFF;

SET IDENTITY_INSERT [Language] ON;
INSERT INTO [Language](LanguageId, [Language])
SELECT DISTINCT LanguageId, [Language]
FROM FilmStaging
SET IDENTITY_INSERT [Language] OFF;

SET IDENTITY_INSERT Film ON;
INSERT INTO Film(FilmId,FilmName,FilmSynopsis,FilmRunTimeMinutes,FilmReleaseDate,
			FilmBudgetDollars,FilmBoxOfficeDollars,FilmOscarNominations,FilmOscarWins,
			DirectorId, CertificateId,LanguageId,CountryId,StudioId)
SELECT DISTINCT FilmId, [Name], FilmSynopsis, FilmRunTimeMinutes, FilmReleaseDate,FilmBudgetDollars,
		FilmBoxOfficeDollars,FilmOscarNominations, FilmOscarWins, DirectorId, CertificateId,
		LanguageId, CountryId, FilmStudioId
FROM FilmStaging;
SET IDENTITY_INSERT Film OFF;

SET IDENTITY_INSERT [Cast] ON;
INSERT INTO [Cast](CastId, CastCharacterName, ActorId, FilmId)
SELECT DISTINCT CastId, CastCharacterName, ActorId, FilmId
FROM FilmStaging
SET IDENTITY_INSERT [Cast] OFF;