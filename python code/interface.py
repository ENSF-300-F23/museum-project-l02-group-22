# interface.py

class Interface:
    def __init__(self, user_manager, art_object_manager):
        self.user_manager = user_manager
        self.art_object_manager = art_object_manager

    def display_menu(self):
        print("1. Add User\n2. Authenticate User\n3. Add Art Object\n4. Search Art Objects\n5. Exit")

    def handle_user_input(self, choice):
        if choice == '1':
            username = input("Enter username: ")
            password = input("Enter password: ")
            role = input("Enter role: ")
            self.user_manager.add_user(username, password, role)
        elif choice == '2':
            username = input("Enter username: ")
            password = input("Enter password: ")
            if self.user_manager.authenticate_user(username, password):
                print("Authentication successful!")
            else:
                print("Authentication failed. Invalid username or password.")
        elif choice == '3':
            data = {
                'title': input("Enter title: "),
                'artist': input("Enter artist: "),
                'year': input("Enter year: "),
                'description': input("Enter description: "),
                'type': input("Enter type of art: "),
                'culture': input("Enter culture of origin: "),
                'epoch': input("Enter epoch: ")
            }
            self.art_object_manager.add_art_object(data)
        elif choice == '4':
            criteria = input("Enter search criteria: ")
            results = self.art_object_manager.search_art_objects(criteria)
            print("Search Results:")
            for result in results:
                print(result)
        elif choice == '5':
            print("Exiting application.")
            exit()
        else:
            print("Invalid choice. Please try again.")
