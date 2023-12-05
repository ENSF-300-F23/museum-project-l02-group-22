# main.py


from database_manager import DatabaseManager
from user_manager import UserManager
from art_object_manager import ArtObjectManager
from interface import Interface

def main():
    db_manager = DatabaseManager("your_host", "your_user", "your_password", "your_database")
    user_manager = UserManager(db_manager)
    art_object_manager = ArtObjectManager(db_manager)
    interface = Interface(user_manager, art_object_manager)

    # Add main application logic here

if __name__ == "__main__":
    main()
