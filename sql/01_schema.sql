DROP TABLE IF EXISTS track_artists;
DROP TABLE IF EXISTS tracks;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  artist_id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE albums (
  album_id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL,
  release_year INT,
  CONSTRAINT uq_album UNIQUE (album_name, release_year)
);

CREATE TABLE tracks (
  track_id TEXT PRIMARY KEY,
  track_name TEXT NOT NULL,
  album_id INT REFERENCES albums(album_id),
  explicit BOOLEAN,
  popularity INT,
  duration_ms INT,
  year INT,
  release_date DATE,
  danceability NUMERIC,
  energy NUMERIC,
  loudness NUMERIC,
  valence NUMERIC,
  tempo NUMERIC,
  key INT,
  mode INT,
  speechiness NUMERIC,
  acousticness NUMERIC,
  instrumentalness NUMERIC,
  liveness NUMERIC,
  time_signature INT
);

CREATE TABLE track_artists (
  track_id TEXT REFERENCES tracks(track_id) ON DELETE CASCADE,
  artist_id INT REFERENCES artists(artist_id) ON DELETE CASCADE,
  PRIMARY KEY (track_id, artist_id)
);

CREATE INDEX idx_tracks_year ON tracks(year);
CREATE INDEX idx_tracks_explicit ON tracks(explicit);
CREATE INDEX idx_tracks_key_mode ON tracks(key, mode);
