from pymongo.mongo_client import MongoClient
from dotenv import load_dotenv
import os
load_dotenv()
    
class DB_model():
    def __init__(self):
        self.client=MongoClient(f'mongodb+srv://{os.environ["DB_USER"]}:{os.environ["DB_PASS"]}@cluster0.n5ouq33.mongodb.net/?retryWrites=true&w=majority')
        self.client.admin.command('ping')
    
    def back_up():
        pass
    
    def download():
        pass
    
    def upload():
        pass
    
db=DB_model()


class User():
    def create_user():
        pass
    
    def get_user():
        pass
    
    def edit_user():
        pass
    
    def delete_user():
        pass


class Session():
    def get_session():
        pass
    
    def login_session():
        pass
    
    def clear_session():
        pass


class Room():#a room is settled for handling a game
    def create_room():
        pass
    
    def delete_room():
        pass
    
    def pairing_room():# 匹配
        pass
    
    def add_user():
        pass
    
    def remove_user():
        pass

class Game():#a room is settled for handling a game
    def create_game():
        pass
    
    def get_game():
        pass
    
    def edit_game():# 匹配
        pass
    
    def delete_game():
        pass