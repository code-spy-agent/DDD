import mysql.connector
from mysql.connector import Error
from config import db_config

def create_connection():
    try:
        connection = mysql.connector.connect(**db_config)
        return connection
    except Error as e:
        print(f"Error connecting to MySQL database: {e}")
        return None

def execute_query(connection, query, params=None):
    cursor = connection.cursor()
    try:
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)
        connection.commit()
    except Error as e:
        print(f"Error executing query: {e}")
    finally:
        cursor.close()
