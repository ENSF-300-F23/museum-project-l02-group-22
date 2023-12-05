# art_object_manager.py

class ArtObjectManager:
    def __init__(self, database_manager):
        self.db_manager = database_manager

    def add_art_object(self, data):
        if not all(data.values()):
            print("Error: All fields are required.")
            return
        query = """
        INSERT INTO Art_Object (Art_Title, Artist_Name, Type_of_Art, Creation_Time, Art_Description, Culture_of_Origin, Epoch)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        params = (data.get('title'), data.get('artist'), data.get('type'), data.get('year'), data.get('description'), data.get('culture'), data.get('epoch'))
        self.db_manager.execute_query(query, params)
        print("Art object added successfully!")

    def search_art_objects(self, criteria):
        if not criteria:
            print("Error: Search criteria cannot be empty.")
            return []
        query = f"SELECT * FROM Art_Object WHERE Art_Title LIKE %s OR Artist_Name LIKE %s OR Art_Description LIKE %s"
        params = (f"%{criteria}%", f"%{criteria}%", f"%{criteria}%")
        results = self.db_manager.fetch_data(query, params)
        return results
