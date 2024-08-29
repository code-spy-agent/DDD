import json
from database import create_connection, execute_query
from models import (
    create_movies_table, create_genres_table, create_actors_table,
    create_movie_genres_table, create_movie_actors_table
)

def insert_movie(connection, movie):
    insert_movie_query = """
    INSERT INTO movies (title, year, storyline, posterurl)
    VALUES (%s, %s, %s, %s)
    """
    movie_data = (movie['title'], movie['year'], movie['storyline'], movie['posterurl'])
    cursor = connection.cursor()
    cursor.execute(insert_movie_query, movie_data)
    movie_id = cursor.lastrowid
    connection.commit()
    cursor.close()
    return movie_id

def insert_genre(connection, genre):
    insert_genre_query = """
    INSERT IGNORE INTO genres (name) VALUES (%s)
    """
    execute_query(connection, insert_genre_query, (genre,))
    cursor = connection.cursor()
    cursor.execute("SELECT id FROM genres WHERE name = %s", (genre,))
    genre_id = cursor.fetchone()[0]
    cursor.close()
    return genre_id

def insert_actor(connection, actor):
    insert_actor_query = """
    INSERT IGNORE INTO actors (name) VALUES (%s)
    """
    execute_query(connection, insert_actor_query, (actor,))
    cursor = connection.cursor()
    cursor.execute("SELECT id FROM actors WHERE name = %s", (actor,))
    actor_id = cursor.fetchone()[0]
    cursor.close()
    return actor_id

def insert_movie_genre(connection, movie_id, genre_id):
    insert_movie_genre_query = """
    INSERT IGNORE INTO movie_genres (movie_id, genre_id) VALUES (%s, %s)
    """
    execute_query(connection, insert_movie_genre_query, (movie_id, genre_id))

def insert_movie_actor(connection, movie_id, actor_id):
    insert_movie_actor_query = """
    INSERT IGNORE INTO movie_actors (movie_id, actor_id) VALUES (%s, %s)
    """
    execute_query(connection, insert_movie_actor_query, (movie_id, actor_id))

def main():
    # Load JSON data
    with open('your_json_file.json', 'r') as file:
        movie_data = json.load(file)

    connection = create_connection()
    if connection is None:
        return

    # Create tables
    execute_query(connection, create_movies_table)
    execute_query(connection, create_genres_table)
    execute_query(connection, create_actors_table)
    execute_query(connection, create_movie_genres_table)
    execute_query(connection, create_movie_actors_table)

    # Insert data
    for movie in movie_data:
        movie_id = insert_movie(connection, movie)
        
        for genre in movie['genres']:
            genre_id = insert_genre(connection, genre)
            insert_movie_genre(connection, movie_id, genre_id)
        
        for actor in movie['actors']:
            actor_id = insert_actor(connection, actor)
            insert_movie_actor(connection, movie_id, actor_id)

    connection.close()
    print("Data insertion completed successfully.")

if __name__ == "__main__":
    main()
