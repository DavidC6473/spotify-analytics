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

<details>
  <summary><strong>Tempo ranges per subgenre (stacked bars)</strong></summary>

  <img src="./figures/tempo_buckets_by_subgenre.png" alt="Tempo ranges per subgenre (stacked bars)" width="900"/>
</details>

<details>
  <summary><strong>Song length spread (boxplot)</strong></summary>

  <img src="./figures/duration_distribution_by_subgenre.png" alt="Song length spread (boxplot)" width="900"/>
</details>

<details>
  <summary><strong>Which features move together (incl. popularity)</strong></summary>

  <img src="./figures/feature_correlation_heatmap.png" alt="Feature correlation heatmap" width="900"/>
</details>

<details>
  <summary><strong>Louder generally = higher energy (with trendline)</strong></summary>

  <img src="./figures/loudness_vs_energy.png" alt="Loudness vs Energy (with trendline)" width="900"/>
</details>

<details>
  <summary><strong>Top 5% vs others (grouped bars)</strong></summary>

  <img src="./figures/hit_vs_nonhit_feature_profile.png" alt="Top 5% vs others (grouped bars)" width="900"/>
</details>

<details>
  <summary><strong>Do instrumentals perform? (binned line)</strong></summary>

  <img src="./figures/instrumentalness_vs_popularity.png" alt="Instrumentalness vs Popularity (binned line)" width="900"/>
</details>

<details>
  <summary><strong>Bigger isn’t always better (bubble plot)</strong></summary>

  <img src="./figures/subgenre_size_vs_popularity_bubble.png" alt="Subgenre size vs popularity (bubble plot)" width="900"/>
</details>

<details>
  <summary><strong>Output vs average popularity</strong></summary>

  <img src="./figures/artist_productivity_vs_popularity.png" alt="Artist productivity vs average popularity" width="900"/>
</details>

<details>
  <summary><strong>Quick “mood map”</strong></summary>

  <img src="./figures/energy_danceability_quadrants.png" alt="Energy vs Danceability quadrants" width="900"/>
</details>

<details>
  <summary><strong>Playlist size bins vs avg popularity (violin)</strong></summary>

  <img src="./figures/playlist_size_vs_popularity_violin.png" alt="Playlist size vs average popularity (violin)" width="900"/>
</details>

<details>
  <summary><strong>Danceability / Energy / Valence profiles</strong></summary>

  <img src="./figures/subgenre_feature_profile.png" alt="Danceability / Energy / Valence profiles" width="900"/>
</details>

<details>
  <summary><strong>p50 / p75 / p90 popularity by subgenre</strong></summary>

  <img src="./figures/subgenre_popularity_distribution.png" alt="Popularity quantiles by subgenre" width="900"/>
</details>

<details>
  <summary><strong>Common musical keys / modes</strong></summary>

  <img src="./figures/keys_modes_overall.png" alt="Common musical keys and modes" width="900"/>
</details>

<details>
  <summary><strong>Average popularity for artists (min tracks rule)</strong></summary>

  <img src="./figures/top_artists_avg_pop.png" alt="Average popularity for artists (minimum tracks)" width="900"/>
</details>

<details>
  <summary><strong>Mood vs intensity scatter</strong></summary>

  <img src="./figures/scatter_valence_vs_energy.png" alt="Valence vs Energy scatter" width="900"/>
</details>

<details>
  <summary><strong>Feature trends across years (where dates exist)</strong></summary>

  <img src="./figures/trends_by_release_year.png" alt="Audio feature trends by release year" width="900"/>
</details>



## Run it
```bash
# Postgres
docker run --name spotifypg -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres:16
# Python
pip install -r requirements.txt
# Notebook
jupyter lab  # open notebooks/03_analysis.ipynb
