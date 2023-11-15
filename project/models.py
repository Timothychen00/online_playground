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
    
    def down_load():
        pass
    
    def upload():
        pass
    
db=DB_model()

class User_Management():
    pass
    
class User():
    pass
    
class Game():
    pass