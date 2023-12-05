#database_manager.py


import mysql.connector

class DBError(Exception):
    """Custom exception class to handle database errors."""
    pass

class DatabaseManager:
    def __init__(self, host, user, password, database):
        try:
            self.connection = mysql.connector.connect(
                host=host,
                user=user,
                password=password,
                database=database,
                autocommit=True
            )
            self.cursor = self.connection.cursor(dictionary=True)
        except mysql.connector.Error as err:
            raise DBError(f"DB connection error: {err}")

    def execute_query(self, query, params=None):
        try:
            self.cursor.execute(query, params)
            return self.cursor.lastrowid
        except mysql.connector.Error as err:
            self.connection.rollback()
            raise DBError(f"Error executing query: {err}")

    def fetch_data(self, query, params=None):
        try:
            self.cursor.execute(query, params)
            return self.cursor.fetchall()
        except mysql.connector.Error as err:
            raise DBError(f"Error fetching data: {err}")

    def __del__(self):
        try:
            if self.connection.is_connected():
                self.cursor.close()
                self.connection.close()
        except mysql.connector.Error as err:
            raise DBError(f"Error closing connection: {err}")
