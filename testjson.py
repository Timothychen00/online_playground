from flask import Flask,session,jsonify
app=Flask(__name__)
app.secret_key='123123'

@app.route('/')
def home():
    return "1"

@app.route('/set')
def set():
    session['a']=2
    print(session)
    return jsonify(session)

@app.route('/get')
def get():
    print(session)
    return jsonify(session)

@app.route('/clear')
def clear():
    session.clear()
    return jsonify(session)


if __name__=='__main__':
    app.run(port='7777',debug=True)