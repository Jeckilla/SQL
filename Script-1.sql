CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	name_of_genre VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musicians (
	musician_id SERIAL PRIMARY KEY,
	name_of_musician VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenresMusicians (
	genre_id INTEGER NOT NULL REFERENCES Genres(genre_id),
	musician_id INTEGER NOT NULL REFERENCES Musicians(musician_id),
	CONSTRAINT pk PRIMARY KEY (genre_id, musician_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	name_of_album VARCHAR(60) NOT NULL,
	year_of_release INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS AlbumsMusicians (
	album_id INTEGER NOT NULL REFERENCES Albums(album_id),
	musician_id INTEGER NOT NULL REFERENCES Musicians(musician_id),
	CONSTRAINT am PRIMARY KEY (album_id, musician_id)
);

CREATE TABLE IF NOT EXISTS Songs (
	song_id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES Albums(album_id),
	name_of_song TEXT NOT NULL,
	duration numeric NOT NULL
);

CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL PRIMARY KEY,
	title_of_collection VARCHAR(60) NOT NULL,
	year_of_release INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS CollectionsSongs (
	collection_id INTEGER REFERENCES Collections(collection_id),
	song_id INTEGER REFERENCES Songs(song_id),
	CONSTRAINT cs PRIMARY KEY (collection_id, song_id)
);