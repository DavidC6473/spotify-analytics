-- Genre Summary
CREATE OR REPLACE VIEW genre_summary AS
SELECT
    playlist_genre,
    COUNT(*) AS track_count,
    ROUND(AVG(track_popularity)::numeric,1) AS avg_popularity,
    ROUND(AVG(danceability)::numeric,3) AS avg_danceability,
    ROUND(AVG(energy)::numeric,3) AS avg_energy,
    ROUND(AVG(valence)::numeric,3) AS avg_valence
FROM staging_tracks
GROUP BY playlist_genre
ORDER BY track_count DESC;

-- Subgenre popularity (min 100 tracks)
CREATE OR REPLACE VIEW subgenre_popularity AS
SELECT
    playlist_subgenre,
    COUNT(*) AS n_tracks,
    ROUND(AVG(track_popularity)::numeric,1) AS avg_popularity
FROM staging_tracks
WHERE playlist_subgenre IS NOT NULL AND playlist_subgenre <> ''
GROUP BY playlist_subgenre
HAVING COUNT(*) >= 100
ORDER BY avg_popularity DESC;

-- Keys / modes distribution from normalised table
CREATE OR REPLACE VIEW key_mode_count AS
SELECT
    key,
    mode,
    COUNT(*) AS n
FROM tracks 
GROUP BY key, mode
ORDER BY n DESC;