from flask_restful import Resource,reqparse
from flask import request
import werkzeug
from project.models import *

#413-> api phase
#414-> model phase

class UserAPI(Resource):
    #io
    parser=reqparse.RequestParser()
    # use for addition requirements(put,get,post)
    # parser.add_argument('name',type=str,location=['values'])
    
    def get(self):
        pass
    
    def post(self):
        pass
    
    def delete(self):
        pass
    
    def put(self):
        pass
    
class SessionAPI(Resource):
    #io
    parser=reqparse.RequestParser()
    # use for addition requirements(put,get,post)
    # parser.add_argument('name',type=str,location=['values'])
    
    def get(self):
        pass
    
    def post(self):
        pass
    
    def delete(self):
        pass
    
    def put(self):
        pass
    
class SessionAPI(Resource):
    #io
    parser=reqparse.RequestParser()
    # use for addition requirements(put,get,post)
    # parser.add_argument('name',type=str,location=['values'])
    
    def get(self):
        pass
    
    def post(self):
        pass
    
    def delete(self):
        pass
    
    def put(self):
        pass
    
class GameAPI(Resource):
    #io
    parser=reqparse.RequestParser()
    # use for addition requirements(put,get,post)
    # parser.add_argument('name',type=str,location=['values'])
    
    def get(self):
        self.parser.add_argument('game_name',type=str,location=['values'],action='append')
        args = self.parser.parse_args()
        result=Game.get_game({'name':args['game_name']})
        if 'err' in result:
            return result,414
        return result,200
    
    def post(self):
        self.parser.add_argument('game_name',type=str,location=['values'],action='append')
        self.parser.add_argument('author',type=str,location=['values'],action='append')
        self.parser.add_argument('description',type=str,location=['values'],action='append')
        self.parser.add_argument('users_number',type=str,location=['values'],action='append')
        self.parser.add_argument('sync_mode',type=str,location=['values'],action='append')
        self.parser.add_argument('sync_variavles',type=str,location=['values'],action='append')
        self.parser.add_argument('code_file', type=werkzeug.datastructures.FileStorage, location='files')
        args = self.parser.parse_args()
        print(args)
        # for i in ['game_name','author','description','users_number','sync_mode','sync_variavles','code_file']:
        #     if not args['game_name']:
        #         return {'msg':i+' required!'},413
        # result=Game.create_game(args)
        # if 'err' in result:
        #     return result,414
        # return result,200
        

    def delete(self):
        pass
    
    def put(self):
        pass

class RoomAPI(Resource):
    #io
    # parser=reqparse.RequestParser()
    # use for addition requirements(put,get,post)
    parser=reqparse.RequestParser()
    
    def get(self):
        self.parser.add_argument('filter_key',type=str,location=['values'],action='append')
        self.parser.add_argument('filter_value',type=str,location=['values'],action='append')
        self.parser.add_argument('isSingle',type=bool,location=['values'])
        args = self.parser.parse_args()
        combined_filter={}
        if args['filter_key']:
            if len(args['filter_key'])==len(args['filter_value']):
                combined_filter={args['filter_key'][index]:args['filter_value'][index] for index in range(len(args['filter_key']))}
            else:
                return {'err':'filter_key and filter_value does not match','phase':'API_Parsing'},413

        print(combined_filter)
        
        result=Room.get_room(combined_filter,args['isSingle'])
        if 'err' in result:
            return result,414
        return result,200
    
    def post(self):# create room /sid/game
        parser=reqparse.RequestParser()
        self.parser.add_argument('sid',type=str,location=['values'],required=True)
        self.parser.add_argument('game',type=str,location=['values'],required=True)
        args = self.parser.parse_args()
        print(args)
        result=Room.create_room(args)
        return result
    
    def delete(self):
        parser=reqparse.RequestParser()
        
        pass
    
    def put(self):
        parser=reqparse.RequestParser()
        self.parser.add_argument('roomid',type=str,location=['values'])
        self.parser.add_argument('sid',type=str,location=['values'],required=True)
        self.parser.add_argument('action',type=str,location=['values'],required=True)#which method
        args = self.parser.parse_args()
        
        if args['action']=='join':
            result=Room.join_room(args['roomid'],args['sid'])
        elif args['action']=='pairing':
            result=Room.pairing_room(args['sid'])
        elif args['action']=='leave':
            result=Room.leave_room(args['roomid'],args['sid'])
            
        