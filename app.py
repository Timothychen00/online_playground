from flask import Flask, render_template,request
from flask_socketio import SocketIO,send,emit,join_room, leave_room
import random
app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
app.config['DEBUG']=True
socketio = SocketIO(app)
times=0
userlist=[]

temp_id=None

@app.route("/debug")
def debug():
    str(userlist)
    data='<ul>'
    for index in range(len(userlist)):
        data+="<li>"+str(userlist[index])+"</li>"
    return data

@app.route("/")
def home():
    return render_template("processing.html")

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
    timess=0
    for user in userlist:
        if request.sid ==user['sid']:
            timess+=1
    if timess==0:
        userlist.append({
            'sid':request.sid,
            'status':False,
            'game':"pingpong"
        })
    print(request.sid)
    
@socketio.on('join')
def handle_connect(data):
    global userlist
    timess=0
    
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
                direction_x=random.choice([-1,1])
                direction_y=random.choice([-1,1])
                speedx=random.uniform(1,5)*direction_x
                speedy=random.uniform(1,5)*direction_y
                
                emit('sync',{'player':2,"opponent":userlist[(index*2)]['username'],'status':'info',"game":"pingpong"},to=request.sid)#sned to player2
                emit('sync',{'player':1,"opponent":userlist[(index*2)+1]['username'],'status':'info',"game":"pingpong"},to=userlist[(index*2)]['sid'])#sned toplayer1
                # emit('sync',{'player':2,"opponent":userlist[(index*2)]['username'],'status':'info','speedx':speedx,'speedy':speedy,"game":"pingpong"},to=request.sid)#sned to player2
                # emit('sync',{'player':1,"opponent":userlist[(index*2)+1]['username'],'status':'info','speedx':speedx,'speedy':speedy,"game":"pingpong"},to=userlist[(index*2)]['sid'])#sned toplayer1

                
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
    
# def check_user(sid):
#     for index in range(len(userlist)):
#         if request.sid ==userlist[index]['sid']:
#             return True
#     return False
     

if __name__ == '__main__':
    socketio.run(app,'0.0.0.0')