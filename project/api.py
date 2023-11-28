from flask_restful import Resource,reqparse
from project.models import User

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
        result=User.create_user(args)
        if result == 'username is already used':
            return {'message':result},401
        return {'message':result},200
    
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
        pass
    
    def post(self):
        pass
    
    def delete(self):
        pass
    
    def put(self):
        pass

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