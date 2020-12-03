USE FilmStaging;

CREATE TABLE Actor(
	ActorId INT IDENTITY,
	ActorName VARCHAR(250)
	CONSTRAINT pk_actor PRIMARY KEY (ActorId)
)

CREATE TABLE Director(
	DirectorId INT IDENTITY,
	DirectorName VARCHAR(250),
	CONSTRAINT pk_director PRIMARY KEY (DirectorId)
)

CREATE TABLE [Certificate](
	CertificateId INT IDENTITY,
	[Certificate] VARCHAR(250),
	CONSTRAINT pk_certificate PRIMARY KEY (CertificateId)
)

CREATE TABLE [Language](
	LanguageId INT IDENTITY,
	[Language] VARCHAR(250),
	CONSTRAINT pk_language PRIMARY KEY (LanguageId)
)

CREATE TABLE Country(
	CountryId INT IDENTITY,
	CountryName VARCHAR(250),
	CONSTRAINT pk_country PRIMARY KEY (CountryId)
)

CREATE TABLE Studio(
	StudioId INT IDENTITY,
	StudioName VARCHAR(250),
	CONSTRAINT pk_studio PRIMARY KEY (StudioId)
)

CREATE TABLE Film(
	FilmId INT IDENTITY,
	FilmName VARCHAR(250),
	FilmSynopsis TEXT,
	FilmRunTimeMinutes INT,
	FilmReleaseDate DATETIME,
	FilmBudgetDollars FLOAT,
	FilmBoxOfficeDollars FLOAT,
	FilmOscarNominations INT,
	FilmOscarWins INT,
	DirectorId INT,
	CertificateId INT,
	LanguageId INT,
	CountryId INT,
	StudioId INT,
	CONSTRAINT pk_film PRiMARY KEY (FilmId),
	CONSTRAINT fk_film_director FOREIGN KEY (DirectorId) 
		REFERENCES Director(DirectorId),	
	CONSTRAINT fk_film_certificate FOREIGN KEY (CertificateId)
		REFERENCES [Certificate](CertificateId),
	CONSTRAINT fk_film_language FOREIGN KEY (LanguageId)
		REFERENCES [Language](LanguageId),
	CONSTRAINT fk_film_country FOREIGN KEY (CountryId)
		REFERENCES Country(CountryId),
	CONSTRAINT fk_film_studio FOREIGN KEY (StudioId)
		REFERENCES Studio(StudioId)
)

CREATE TABLE [Cast](
	CastId INT IDENTITY,
	CastCharacterName VARCHAR(250),
	ActorId INT,
	FilmId INT, 
	CONSTRAINT pk_cast PRIMARY KEY (CastId),
	CONSTRAINT fk_cast_actor FOREIGN KEY (ActorId) 
		REFERENCES Actor(ActorId),
	CONSTRAINT fk_cast_film FOREIGN KEY (FilmId)
		REFERENCES Film(FilmId)
)
