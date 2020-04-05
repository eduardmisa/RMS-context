import bcrypt


class password_manager:


    def ecnrypt_password(self, password):
        hashed = bcrypt.hashpw(password, bcrypt.gensalt())
        return hashed


    def verify_password(self, password):
        if bcrypt.checkpw(password, hashed):
            print("It Matches!")
        else:
            print("It Does not Match :(")