# database_manager.py



import mysql.connector

class DatabaseManager:
    def __init__(self, host, user, password, database):
        self.connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database
        )
        self.cursor = self.connection.cursor()

    def execute_query(self, query, values=None):
        self.cursor.execute(query, values)
        self.connection.commit()

    def fetch_data(self, query, values=None):
        self.cursor.execute(query, values)
        return self.cursor.fetchall()

    def __del__(self):
        self.cursor.close()
        self.connection.close()
