# art_object_manager.py


class ArtObjectManager:
    def __init__(self, database_manager):
        self.db_manager = database_manager

    def add_art_object(self, data):
        query = "INSERT INTO art_objects (title, artist, year, description) VALUES (%s, %s, %s, %s)"
        values = (data['title'], data['artist'], data['year'], data['description'])
        self.db_manager.execute_query(query, values)

    def search_art_objects(self, criteria):
        query = "SELECT * FROM art_objects WHERE title LIKE %s OR artist LIKE %s OR description LIKE %s"
        values = ('%' + criteria + '%', '%' + criteria + '%', '%' + criteria + '%')
        return self.db_manager.fetch_data(query, values)

    def manage_exhibitions(self, data):
        # Add exhibition management logic here

    # Add other art object-related methods here
