from flask import Flask,render_template
import os

app=Flask(__name__)
app.secret_key=os.urandom(16).hex()

@app.route("/")
def home():
    return render_template("processing.html")

@app.route("/lobby")
def lobby():
    return render_template("lobby.html")

@app.route("/debug")
def debug():
    return render_template("debug.html")


if __name__=='__main__':
    app.run(debug=True,port=8000,host='0.0.0.0')