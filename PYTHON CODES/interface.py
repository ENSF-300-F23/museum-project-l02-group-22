# interface.py

# interface.py

class Interface:
    def __init__(self, user_manager, art_object_manager):
        self.user_manager = user_manager
        self.art_object_manager = art_object_manager

    def display_menu(self):
        print("1. Add User")
        print("2. Authenticate User")
        print("3. Add Art Object")
        print("4. Search Art Objects")
        print("5. Block User")
        print("6. Unblock User")
        print("7. Exit")

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
            if results:
                print("Search Results:")
                for result in results:
                    print(result)
            else:
                print("No results found.")
        elif choice == '5':
            user_id = int(input("Enter user ID to block: "))
            self.user_manager.block_user(user_id)
        elif choice == '6':
            user_id = int(input("Enter user ID to unblock: "))
            self.user_manager.unblock_user(user_id)
        elif choice == '7':
            print("Exiting application.")
            exit()
        else:
            print("Invalid choice. Please try again.")
