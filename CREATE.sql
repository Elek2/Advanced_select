CREATE TABLE IF NOT EXISTS Genres(
	ID SERIAL PRIMARY KEY,
	Name VARCHAR(60) UNIQUE
);

CREATE TABLE IF NOT EXISTS Artists(
	ID SERIAL PRIMARY KEY,
	Name VARCHAR(60) UNIQUE
);

CREATE TABLE IF NOT EXISTS Genre_Artist(
	Genre_id INT REFERENCES Genres(ID),
	Artist_id INT REFERENCES Artists(ID),
	CONSTRAINT pk PRIMARY KEY  (Genre_id, Artist_id)
);

CREATE TABLE IF NOT EXISTS Artists(
	ID SERIAL PRIMARY KEY,
	Name VARCHAR(60) UNIQUE,
	Year INT CHECK (Year>1500)
);

CREATE TABLE IF NOT EXISTS Artist_Album(
	Artist_id INT REFERENCES Artists(ID),
	Album_id INT REFERENCES Albums(ID),
	CONSTRAINT pk1 PRIMARY KEY (Artist_id, Album_id)
);

CREATE TABLE IF NOT EXISTS Tracks(
	ID SERIAL PRIMARY KEY,
	Name VARCHAR(60) UNIQUE,
	Lenght INT CHECK (Lenght>0),
	Album_id INT REFERENCES Albums(ID)
);

CREATE TABLE IF NOT EXISTS Collections(
	ID SERIAL PRIMARY KEY,
	Name VARCHAR(60) UNIQUE,
	Year INT CHECK (Year>1500)
);

CREATE TABLE IF NOT EXISTS Track_Collection(
	Track_id INT REFERENCES Tracks(ID),
	Collection_id INT REFERENCES Collections(ID),
	CONSTRAINT pk2 PRIMARY KEY (Track_id, Collection_id)
);