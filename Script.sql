CREATE TABLE IF NOT EXISTS genres(
	genres_id INTEGER PRIMARY KEY,
	"name" VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist(
	artist_id INTEGER PRIMARY KEY,
	"name" VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS genres_artist(
	genres_id INTEGER REFERENCES genres(genres_id),
	artist_id INTEGER REFERENCES artist(artist_id),
	CONSTRAINT genres_artist_pkey PRIMARY KEY (genres_id, artist_id)
);

CREATE TABLE IF NOT EXISTS album(
	album_id INTEGER PRIMARY KEY,
	"name" VARCHAR(80) NOT NULL,
	"year of release" DATE NOT NULL 
);

CREATE TABLE IF NOT EXISTS artist_album(
	artist_id INTEGER REFERENCES artist(artist_id),
	album_id INTEGER REFERENCES album(album_id),
	CONSTRAINT artist_album_pkey PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS tracks(
	tracks_id INTEGER PRIMARY KEY,
	"name" VARCHAR(80) NOT NULL,
	"duration" INTEGER NOT NULL,
	album_id INTEGER NOT NULL REFERENCES album(album_id)
);

CREATE TABLE IF NOT EXISTS compilation(
	compilation_id INTEGER PRIMARY KEY,
	"name" VARCHAR(60) NOT NULL,
	"year of release" DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS tracks_compilation(
	id_tracks_compilation SERIAL PRIMARY KEY,
	tracks_id INTEGER REFERENCES tracks(tracks_id),
	compilation_id INTEGER REFERENCES compilation(compilation_id),
	tracks VARCHAR(80) NOT NULL
);

