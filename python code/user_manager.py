# user_manager.py



class UserManager:
    def __init__(self, database_manager):
        self.db_manager = database_manager

    def authenticate_user(self, username, password):
        query = "SELECT * FROM users WHERE username = %s AND password = %s"
        values = (username, password)
        result = self.db_manager.fetch_data(query, values)
        return len(result) > 0

    def add_user(self, username, password, role):
        query = "INSERT INTO users (username, password, role) VALUES (%s, %s, %s)"
        values = (username, password, role)
        self.db_manager.execute_query(query, values)

    def edit_user(self, user_id, new_username, new_password, new_role):
        query = "UPDATE users SET username = %s, password = %s, role = %s WHERE id = %s"
        values = (new_username, new_password, new_role, user_id)
        self.db_manager.execute_query(query, values)

    def block_user(self, user_id):
        query = "DELETE FROM users WHERE id = %s"
        values = (user_id,)
        self.db_manager.execute_query(query, values)
