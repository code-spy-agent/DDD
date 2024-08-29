from database import create_connection, execute_query

def fetch_all_movies():
    connection = create_connection()
    if connection is None:
        return []

    query = """
    SELECT m.id, m.title, m.year, m.storyline, m.posterurl,
           GROUP_CONCAT(DISTINCT g.name) as genres,
           GROUP_CONCAT(DISTINCT a.name) as actors
    FROM movies m
    LEFT JOIN movie_genres mg ON m.id = mg.movie_id
    LEFT JOIN genres g ON mg.genre_id = g.id
    LEFT JOIN movie_actors ma ON m.id = ma.movie_id
    LEFT JOIN actors a ON ma.actor_id = a.id
    GROUP BY m.id
    """

    cursor = connection.cursor(dictionary=True)
    cursor.execute(query)
    movies = cursor.fetchall()
    cursor.close()
    connection.close()

    # Convert genres and actors from string to list
    for movie in movies:
        movie['genres'] = movie['genres'].split(',') if movie['genres'] else []
        movie['actors'] = movie['actors'].split(',') if movie['actors'] else []

    return movies

def fetch_movies_by_genre(genre):
    connection = create_connection()
    if connection is None:
        return []

    query = """
    SELECT m.id, m.title, m.year, m.storyline, m.posterurl,
           GROUP_CONCAT(DISTINCT g.name) as genres,
           GROUP_CONCAT(DISTINCT a.name) as actors
    FROM movies m
    LEFT JOIN movie_genres mg ON m.id = mg.movie_id
    LEFT JOIN genres g ON mg.genre_id = g.id
    LEFT JOIN movie_actors ma ON m.id = ma.movie_id
    LEFT JOIN actors a ON ma.actor_id = a.id
    WHERE g.name = %s
    GROUP BY m.id
    """

    cursor = connection.cursor(dictionary=True)
    cursor.execute(query, (genre,))
    movies = cursor.fetchall()
    cursor.close()
    connection.close()

    # Convert genres and actors from string to list
    for movie in movies:
        movie['genres'] = movie['genres'].split(',') if movie['genres'] else []
        movie['actors'] = movie['actors'].split(',') if movie['actors'] else []

    return movies

# Add more functions for other types of queries as needed
