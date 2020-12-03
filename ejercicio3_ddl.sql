--CREATE DATABASE FilmStaging;
USE FilmStaging;

CREATE TABLE FilmStaging(
	FilmId [VARCHAR](MAX) NULL,
	Name [VARCHAR](MAX) NULL, 
	DirectorId [VARCHAR](MAX) NULL, 
	DirectorName [VARCHAR](MAX) NULL,
	LanguageId [VARCHAR](MAX) NULL,
	Language [VARCHAR](MAX) NULL,
	CountryId [VARCHAR](MAX) NULL,
	CountryName [VARCHAR](MAX) NULL,
	FilmStudioId [VARCHAR](MAX) NULL,
	StudioName [VARCHAR](MAX) NULL,
	CertificateId [VARCHAR](MAX) NULL,
	Certificate [VARCHAR](MAX) NULL,
	ActorId [VARCHAR](MAX) NULL,
	ActorName [VARCHAR](MAX) NULL,
	CastId [VARCHAR](MAX) NULL,
	CastCharacterName [VARCHAR](MAX) NULL,
	FilmSynopsis [VARCHAR](MAX) NULL,
	FilmRunTimeMinutes [VARCHAR](MAX) NULL,
	FilmReleaseDate [VARCHAR](MAX) NULL,
	FilmBudgetDollars [VARCHAR](MAX) NULL,
	FilmBoxOfficeDollars [VARCHAR](MAX) NULL,
	FilmOscarNominations [VARCHAR](MAX) NULL,
	FilmOscarWins [VARCHAR](MAX) NULL
)