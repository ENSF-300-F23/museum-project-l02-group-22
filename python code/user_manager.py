# user_manager.py


import hashlib

class UserManager:
    def __init__(self, database_manager):
        self.db_manager = database_manager

    def authenticate_user(self, username, password):
        if username == "" or password == "":
            return False
        hashed_password = hashlib.sha256(password.encode()).hexdigest()
        query = "SELECT * FROM Users WHERE username = %s AND password = %s"
        params = (username, hashed_password)
        result = self.db_manager.fetch_data(query, params)
        return len(result) > 0

    def add_user(self, username, password, role):
        if username == "" or password == "" or role == "":
            print("Error: All fields are required.")
            return
        hashed_password = hashlib.sha256(password.encode()).hexdigest()
        query = "INSERT INTO Users (username, password, role) VALUES (%s, %s, %s)"
        params = (username, hashed_password, role)
        self.db_manager.execute_query(query, params)
        print("User added successfully!")

    def edit_user(self, user_id, new_username, new_password, new_role):
        hashed_password = hashlib.sha256(new_password.encode()).hexdigest()
        query = "UPDATE Users SET username = %s, password = %s, role = %s WHERE user_id = %s"
        params = (new_username, hashed_password, new_role, user_id)
        self.db_manager.execute_query(query, params)
        print("User information updated successfully!")

    def block_user(self, user_id):
        query = "UPDATE Users SET status = 'blocked' WHERE user_id = %s"
        params = (user_id,)
        self.db_manager.execute_query(query, params)
        print("User blocked successfully!")
