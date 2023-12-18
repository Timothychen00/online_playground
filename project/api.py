from flask_restful import Resource,reqparse

from flask import session,request
from flask import request
import werkzeug
from project.models import *


class UserAPI(Resource):
    #io
    parser=reqparse.RequestParser()
    # use for addition requirements(put,get,post)
    # parser.add_argument('name',type=str,location=['values'])
    parser.add_argument('email',type=str,location=['values'])
    parser.add_argument('username',type=str,location=['values'])
    parser.add_argument('password',type=str,location=['values'])
    
    def get(self):
        args = self.parser.parse_args()

    
    def post(self):
        args = self.parser.parse_args()
        print(args)
        if len(args['email']) ==0 or len(args['password']) ==0 or len(args['username']) ==0:
            return {'message':'輸入格不能為空'},401
        result=User.create_user(args)
        return {'message':result},200
    
    def delete(self):
        pass
    
    def put(self):
        pass
    
class SessionAPI(Resource):
    #io
    parser=reqparse.RequestParser()
    parser.add_argument('email',type=str,location=['values'])
    parser.add_argument('password',type=str,location=['values'])
    # use for addition requirements(put,get,post)
    # parser.add_argument('name',type=str,location=['values'])
    
    def get(self):
        print(session)
        if 'logged_in' in session and session['logged_in']:
            return {'message':session['username']},200
        return {'message':'not logged in'},200

    
    def post(self):
        args = self.parser.parse_args()
        if len(args['email']) ==0 or len(args['password'])==0:
            return {'message':'輸入格不能為空'},401
        result=Session.login_session(args)
        if result!= 'none_email_is_found' or result!='wrong_password':
            session['username']=result['username']
            session['email']=result['email']
            session['logged_in']=True
            print(session)
            return {'message':'success','token':os.getenv('SESSION_TOKEN'),'email':result['email'],'username':result['username']},200
        return {'message':result},401
    
    def delete(self):
        pass
    
    def put(self):
        pass
    
    
class GameAPI(Resource):
    #io
    parser=reqparse.RequestParser()
    # use for addition requirements(put,get,post)
    # parser.add_argument('name',type=str,location=['values'])
    parser.add_argument('image_url',type=str,location=['values'])
    parser.add_argument('game_name',type=str,location=['values'])
    parser.add_argument('author',type=str,location=['values'])
    parser.add_argument('description',type=str,location=['values'])
    parser.add_argument('users_number',type=str,location=['values'])
    parser.add_argument('sync_mode',type=str,location=['values'])
    parser.add_argument('sync_variavles',type=str,location=['values'],action='append')
    # parser.add_argument('code_file', type=str, location=['values','json'])
    parser.add_argument('isSingle', type=str, location='values')

    def get(self):
        self.parser.add_argument('game_name',type=str,location=['values'],action='append')
        args = self.parser.parse_args()
        

        
        if args['isSingle']=='False':
            result=Game.get_game({},isSingle=False)
        else:
            result=Game.get_game({'name':args['game_name']},isSingle=True)
        print(result)
        if 'err' in result:
            return result,414
        return result,200
    
    
    def post(self):
        print('send')
        data=request.get_json()
        print(data)

        result=Game.create_game(data)
        print(result)
        if 'err' in result:
            return result,414
        with open('project/games/'+result.split()[0]+'.pde', 'w+') as f:
            f.write(data['code_file'])
        for i in ['game_name','author','description','users_number','sync_mode','sync_variavles','code_file']:
            if not data['game_name']:
                return {'msg':i+' required!'},413
        
        return result,200
        
    def delete(self):
        pass
    
    def put(self):
        args = self.parser.parse_args()
        session['image_url']=args['image_url']

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
            

