from flask_restful import Resource,reqparse
from flask import session
from project.models import User,Session

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
        print("here",args)
        if len(args['email']) ==0 or len(args['password'])==0:
            return {'message':'輸入格不能為空'},401
        result=Session.login_session(args)
        if result!= 'none_email_is_found' or result!='wrong_password':
            session['username']=result['username']
            session['email']=result['email']
            session['logged_in']=True
            print(session)
            return {'message':'success'},200
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
    parser.add_argument('game_name',type=str,location=['values'])
    parser.add_argument('game_description',type=str,location=['values'])
    parser.add_argument('image_url',type=str,location=['values'])
    def get(self):
        pass
    
    def post(self):
        args = self.parser.parse_args()
        print(args)
        return {'message':'success'},200
    
    def delete(self):
        pass
    
    def put(self):
        args = self.parser.parse_args()
        session['image_url']=args['image_url']

class RoomAPI(Resource):
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