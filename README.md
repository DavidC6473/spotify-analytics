# Spotify Analytics (Kaggle + Python + PostgreSQL + Docker)

I wanted to see what *actually* lines up with popularity on Spotify — energy, danceability, loudness, tempo, mood — across ~30k tracks.  
This is a small end-to-end build: Dockerised Postgres, a tidy schema, simple SQL, and a notebook full of 16 clean visuals.

## What’s inside
- **PostgreSQL (Docker)** for storage + queries  
- **ETL** from CSV → staging → normalized (artists, albums, tracks)  
- **Python (Pandas/Matplotlib/Seaborn)** for analysis/plots  
- **SQL views** for reusable summaries  
- All charts saved in `/figures`

## Data
Kaggle: 30,000 Spotify songs — track/artist/album info, playlist (sub)genres, and audio features (danceability, energy, valence, loudness, tempo), plus a popularity score.

## A few takeaways
- Energy and loudness correlate best with popularity; tempo on its own doesn’t.
- “Hits” (top 5%) are a bit faster, louder, more energetic/positive.
- Instrumentals trend lower on popularity overall, but have strong niches.
- Artists with smaller catalogues often have higher average popularity.
- Playlists ~100–200 tracks look like a sweet spot.

## Charts

#### Tempo ranges per subgenre (stacked bars)
![Chart 1](./figures/tempo_buckets_by_subgenre.png)

#### Song length spread (boxplot)
![Chart 2](./figures/duration_distribution_by_subgenre.png)

#### Which features move together (incl. popularity)
![Chart 3](./figures/feature_correlation_heatmap.png)

#### Louder generally = higher energy (with trendline)
![Chart 4](./figures/loudness_vs_energy.png)

#### Top 5% vs others (grouped bars)
![Chart 5](./figures/hit_vs_nonhit_feature_profile.png)

#### Do instrumentals perform? (binned line)
![Chart 6](./figures/instrumentalness_vs_popularity.png)

#### Bigger isn’t always better (bubble plot)
![Chart 7](./figures/subgenre_size_vs_popularity_bubble.png)

#### Output vs average popularity
![Chart 8](./figures/artist_productivity_vs_popularity.png)

#### Quick “mood map”
![Chart 9](./figures/energy_danceability_quadrants.png)

#### Playlist size bins vs avg popularity (violin)
![Chart 10](./figures/playlist_size_vs_popularity_violin.png)

#### Danceability/Energy/Valence profiles
![Chart 11](./figures/subgenre_feature_profile.png)

#### p50/p75/p90 popularity by subgenre
![Chart 12](./figures/subgenre_popularity_distribution.png)

#### Common musical keys/modes
![Chart 13](./figures/keys_modes_overall.png)

#### Avgerage popularity for artists (min tracks rule)
![Chart 14](./figures/top_artists_avg_pop.png)

#### Mood vs intensity scatter
![Chart 15](./figures/scatter_valence_vs_energy.png)

#### Feature trends across years (where dates exist)
![Chart 16](./figures/trends_by_release_year.png)


## Run it
```bash
# Postgres
docker run --name spotifypg -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres:16
# Python
pip install -r requirements.txt
# Notebook
jupyter lab  # open notebooks/03_analysis.ipynb



