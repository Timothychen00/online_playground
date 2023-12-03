from flask_restful import Resource,reqparse
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
        self.parser.add_argument('sid',type=str,location=['values'],required=True)
        self.parser.add_argument('game',type=str,location=['values'],required=True)
        args = self.parser.parse_args()
        print(args)
        result=Room.create_room(args)
        return result
    
    def delete(self):
        pass
    
    def put(self):
        self.parser.add_argument('action',type=str,location=['values'],required=True)#which method
        