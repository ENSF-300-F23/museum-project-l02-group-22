#database_manager.py

import mysql.connector

class DBError(Exception):
    """Custom exception class to handle database errors"""
    pass

class DatabaseManager:
    def __init__(self, host, user, password, database):
        try:
            self.connection = mysql.connector.connect(
                host=host,
                user=user,
                password=password,
                database=database
            )
            self.cursor = self.connection.cursor()
        except mysql.connector.Error as err:
            raise DBError(f"DB connection error: {err}")

    def execute_query(self, query, params=None):
        try:
            self.cursor.execute(query, params)
            self.connection.commit()
        except mysql.connector.Error as err:
            raise DBError(f"Error executing query: {err}")

    def fetch_data(self, query, params=None):
        try:
            self.cursor.execute(query, params)
            return self.cursor.fetchall()
        except mysql.connector.Error as err:
            raise DBError(f"Error fetching data: {err}")

    def __del__(self):
        try:
            self.cursor.close()
            self.connection.close()
        except mysql.connector.Error as err:
            raise DBError(f"Error closing connection: {err}")
