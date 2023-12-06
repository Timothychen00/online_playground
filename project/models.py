from pymongo.mongo_client import MongoClient
from dotenv import load_dotenv
import os,time
from project.decorators import timing
import random
load_dotenv()
    
# get_method=> err and data
# check_documents=> err
# avoid abort
class DB_model():
    def __init__(self):
        self.client=MongoClient(f'mongodb+srv://{os.environ["DB_USER"]}:{os.environ["DB_PASS"]}@cluster0.n5ouq33.mongodb.net/?retryWrites=true&w=majority')
        self.db=self.client.db
        self.cachable=True
        self.cache=list(self.db['rooms'].find({}))
        
        try:
            self.client.admin.command('ping')
            print('資料庫連線成功')
        except:
            print('資料庫連線失敗')
    
    def back_up():
        pass
    
    def download():
        pass
    
    def upload():
        pass

    def renew_cache(self):
        self.cache=list(self.db['rooms'].find({}))
    
db_model=DB_model()

def check_document(collection='users',key_value={},isSingle:bool=True):# 返回值都是err的錯誤
    '''
    to do a simple check of all the files in the databse
    '''
    # print(key_value)
    if len(key_value) or not isSingle:#finding situation->set  issingle to false to enable all round searching
        counts=db_model.db[collection].count_documents(key_value)
        if counts==0:
            return {'err':'not found'}
        # >0
        if isSingle:
            if counts>1:
                return {'err':'too many results'}
        return ''
    return {'err':'key and value are required for checking documents'}

class User:
    def create_user(data:dict):
        pass
    
    def get_user(filter:dict,isSingle=True):
        pass
    
    def edit_user(filter:dict,data:dict):
        pass
    
    def delete_user(filter:dict,isSingle=True):
        pass
    
    def connect_user():
        pass


class Session():
    def get_session():
        pass
    
    def login_session(args):
        pass
    
    def clear_session():
        pass


class Room():#a room is settled for handling a game
    def create_room(args:dict):
        data={
            '_id':"R"+str(time.time())[-5:],#6碼
            "users":[
                args['sid'],
            ],
            "game":args['game'],
            "status":"waiting",# waiting pairing gaming
        }
        result=db_model.db['rooms'].insert_one(data)
        return f"{result.inserted_id} created!"


    # def update_cache():
    #     db_model.cache=
    # @timing
    def get_room(filter,isSingle=True):
            result=check_document('rooms',filter,isSingle)
            print('result',result)
            if 'err' not in result:
                if db_model.cachable:
                    if filter:
                        return_documents=[]
                        for document in db_model.cache:#go through documents
                            for key in filter:
                                if filter[key]!=document.get(key,-1):
                                    break
                                else:#no break
                                    return_documents.append(document)
                        if isSingle:
                            return return_documents[0]
                        return return_documents
                    else:
                        print(isSingle)
                        if isSingle:
                            result=db_model.cache[0]#extract
                        return db_model.cache
                else:#non-cache
                    print(isSingle)
                    result=list(db_model.db['rooms'].find(filter))
                    if isSingle:
                        result=result[0]#extract
            return result

    def edit_room(filter,data):
        result=Room.get_room(filter,isSingle=True)
        print(data)
        if 'err' not in result:
            db_model.db['rooms'].update_one(filter,{"$set":data})
            
            return f"{result['_id']} edited!"
        return result#err return

    def delete_room(filter,isSingle=True):
        result=check_document('rooms',filter,isSingle)
        if 'err' not in result:
            delete_id=result['_id']
            if isSingle:
                db_model.db['rooms'].delete_one(filter)#not yets
            else:
                db_model.db['rooms'].delete_many(filter)
                delete_id=[]
                for i in result:
                    delete_id.append(i['_id'])

            return f"{delete_id} deleted!"
        return result
    
    def pairing_room(sid):# 匹配 隨機加入可以加入的房間
        result=Room.get_room({'status':'waiting'},isSingle=False)
        if 'err' not in result:
            random_room=random.randint(0,len(result)-1)
            join_result=Room.join_room(random_room['_id'],sid)
            return join_result
        return result
    
    def leave_room(roomid,sid):
        result=Room.get_room({'_id':roomid},isSingle=True)
        if 'err' not in result:
            game_result=Game.get_game('games',{'name':result['game']},isSingle=True)# querying to check for game settings 
            if 'err' not in game_result:
                #check if user is in room
                if sid in result['users']:
                    
                    if game_result['users_number']==len(result['users']):#full
                        result['status']='waiting'
                    result['users'].remove(sid)
                    edit_result=Room.edit_room({'_id':roomid},result)
                    return edit_result
                else:
                    return {'err':'not in the room!'}
            return game_result
        return result
    
    def join_room(roomid,sid):
        result=Room.get_room({'_id':roomid},isSingle=True)
        if 'err' not in result:
            game_result=Game.get_game('games',{'name':result['game']},isSingle=True)# querying to check for game settings 
            if 'err' not in game_result:
                if game_result['users_number']>len(result['users']):
                    result['users'].append(sid)
                    
                if game_result['users_number']==len(result['users']):#full
                    result['status']='gaming'
                
                edit_result=Room.edit_room({'_id':roomid},result)
                return edit_result#
            return game_result
        return result
        
    

class Game():#a room is settled for handling a game
    def create_game(args:dict):#name repetenot yet
        data={
            '_id':"G"+str(time.time())[-5:],#6碼
            "name":args['game_name'],
            "author":args['author'],
            'description':args['description'],
            'users_number':args['users_number'],
            'sync_mode':args['sync_mode'],
            'sync_variables':args['sync_variables']#need check as a list
        }
        same_name=db_model.db['games'].find({'name':args['game_name']})
        if same_name:
            return {'err':'the name existed!'}
        
        result=db_model.db['games'].insert_one(data)
        return f"{result.inserted_id} created!"
    
    def get_game(filter,isSingle=True):
        result=check_document('games',filter,isSingle)
        if 'err' not in result:
            result=list(db_model.db['games'].find(filter))
            if isSingle:
                result=result[0]#extract
        return result
    
    def edit_game(filter,data):# 匹配
        result=Game.get_game(filter,isSingle=True)
        print(data)
        if 'err' not in result:
            db_model.db['games'].update_one(filter,{"$set":data})
            
            return f"{result['_id']} edited!"
        return result#err return
        
        
    
    def delete_game(filter,isSingle=True):
        result=check_document('games',filter,isSingle)
        if 'err' not in result:
            delete_id=result['_id']
            if isSingle:
                db_model.db['games'].delete_one(filter)#not yets
            else:
                db_model.db['games'].delete_many(filter)
                delete_id=[]
                for i in result:
                    delete_id.append(i['_id'])

            return f"{delete_id} deleted!"
        return result