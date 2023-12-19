from flask import Flask, render_template,request,jsonify,session
from flask_socketio import SocketIO,send,emit,join_room, leave_room,disconnect
from flask.sessions import SecureCookieSessionInterface
import random,json,os
from flask_restful import Api,Resource
from flask_cors import CORS
from project.models import *
from project.api import UserAPI,SessionAPI,GameAPI,RoomAPI
from dotenv import load_dotenv
from datetime import timedelta
from project.models import db_model
load_dotenv()

app = Flask(__name__)

# session_cookie = SecureCookieSessionInterface().get_signing_serializer(app)

app.config['SECRET_KEY'] = 'os.urandom(16).hex()'
app.config['DEBUG']=True
socketio = SocketIO(app, cors_allowed_origins="*")
CORS(app,resources={r"*": {"origins": "*"}})
# CORS(app, supports_credentials=True)
api=Api(app)
api.add_resource(UserAPI,'/api/user')
api.add_resource(SessionAPI,'/api/session')
api.add_resource(GameAPI,'/api/game')

times=0
userlist=[]
temp_id=None

@app.before_request
def before_request():
    session.permanent = True
    app.permanent_session_lifetime = timedelta(days=30)  # 設定 session 的有效期限

@socketio.on('sync')
def handle_message(data):
    global userlist
    data['status']='syncing'
    for index in range(len(userlist)):
        if userlist[index]['sid']==request.sid:
            if data['player']==1:
                emit('sync',data,to=userlist[index+1]['sid'])
            else:
                emit('sync',data,to=userlist[index-1]['sid'])
        
    print('received message: ' + str(data))
    
    
@socketio.on('connect')
def handle_connect():
    global userlist
    # User.
    print(request.sid)
    
@socketio.on('join')
def handle_connect(data):
    global userlist
    timess=0
    # join list
    for user in userlist:
        if request.sid ==user['sid']:
            timess+=1
            
    if timess==0:
        userlist.append({
            'sid':request.sid,
            'status':False,
            'game':"pingpong"
        })
    
    for index in range(len(userlist)):
        if request.sid ==userlist[index]['sid']:
            userlist[index]['username']=str(data)
    print('len:',len(userlist))
    if len(userlist)%2==0:#start_sync
        for index in range(len(userlist)//2):#0->
            print('index:',index)
            if request.sid ==userlist[(index*2)+1]['sid']:#第偶數個
                print(index*2)
                userlist[(index*2)+1]['status']='start_sync'
                userlist[(index*2)]['status']='start_sync'
                print(userlist[(index-1)*2]['sid'])
                
                emit('sync',{'player':2,"opponent":userlist[(index*2)]['username'],'status':'info',"game":"pingpong"},to=request.sid)#sned to player2
                emit('sync',{'player':1,"opponent":userlist[(index*2)+1]['username'],'status':'info',"game":"pingpong"},to=userlist[(index*2)]['sid'])#sned toplayer1

                
    print('-'*20,'\n',userlist,'\n','-'*20)

@socketio.on('disconnect')
def handle_disconnect():
    global userlist
    timess=0
    for index in range(len(userlist)):
        if request.sid ==userlist[index]['sid']:
            
            if index%2==0:
                emit('sync',{"status":'waiting'},to=userlist[index+1]['sid'])
            else:
                emit('sync',{"status":'waiting'},to=userlist[index-1]['sid'])
            del userlist[index]
            print('-'*20,'\n',userlist,'\n','-'*20)
            
            return
        

@socketio.on('chat')
def handle_chat(data):
    print('sid:',request.sid,data)
    emit('chat',data,broadcast=True)
    return
        
# @socketio.on('debug')
# def handle_debug(data):
#     if 'userlist' in data:
#         emit('debug',{'userlist':json.dumps(userlist)})
    
        
# @app.route('/remove/<string:sid>')
# def remove_user(sid):
#     global userlist
#     disconnect(sid)
#     for index in range(len(userlist)):
#         if sid ==userlist[index]['sid']:
#             del userlist[index]
#     return '1'
     

if __name__ == '__main__':
    socketio.run(app,'0.0.0.0',port=5300,allow_unsafe_werkzeug=True)