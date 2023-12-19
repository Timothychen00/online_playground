from flask import Flask,render_template,session,request,redirect
import os
from flask_cors import CORS
from dotenv import load_dotenv
from datetime import timedelta
env_path = os.path.join(os.path.dirname(__file__), '..', '.env')

# 載入.env檔案中的環境變數
load_dotenv(env_path)

# 使用環境變數
import os
app=Flask(__name__)
app.secret_key='os.urandom(16).hex()'
CORS(app,resources={r"*": {"origins": "*"}})
# CORS(app, supports_credentials=True)

@app.before_request
def before_request():
    session.permanent = True
    app.permanent_session_lifetime = timedelta(days=30)  # 設定 session 的有效期限

@app.route("/")
def home():
    return render_template("lobby.html")

    

@app.route("/lobby")
def lobby():
    return render_template("processing.html")
    

@app.route("/create_game")
def create():
    return render_template("create_game.html")


@app.route("/each-game")
def game():
    return render_template("each-game.html")

@app.route("/debug")
def debug():
    return render_template("debug.html")

@app.route("/test_game")
def test_game():
    return render_template("test_game.html")

@app.route("/games/<id>")
def games(id):
    return render_template("each-game.html",id=id)

@app.route("/verify_session",methods=['POST'])
def verify_session():
    session_token = os.getenv('SESSION_TOKEN')
    session['logged_in']=True
    session['username']=request.get_json()['username']  
    session['email']=request.get_json()['email']  
    print('VERIFYED- ',session)  
    return 'success'

@app.route("/get_session")
def get_session():
    print('GET- ',session)
    if 'logged_in' in session and session['logged_in']:
        return {'message':session['username']},200
    return {'message':'not logged in'},200

@app.route("/chat_room")
def chat_room():
    return render_template("chat_room.html")

@app.route("/logout")
def logout():
    session.clear();
    return redirect('/')


if __name__=='__main__':
    app.run(debug=True,port=8000,host='0.0.0.0')