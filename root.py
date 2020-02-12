# -*- coding: utf-8 -*-

import config as con
from flask import Flask , request ,url_for , redirect ,session , jsonify
from flask import render_template
import pages


app = Flask(__name__ )
app.secret_key = 'YYYY@#$%'

@app.route ('/') 
def index():
    return redirect(url_for('Home_page'))

@app.route('/Home') 
def Home_Page(): 
    pass    
    
@app.route('/login') 
def Login_Page(): 
    pass
     

@app.route('/sinup') 
def Sinup_Page(): 
    pass

@app.route('/courses') 
def Courses_Page(): 
    pass

@app.route('/achievements') 
def Achievements_Page(): 
    pass

@app.route('/TTADP') 
def Dashboard_Page(): 
    pass

if __name__ == '__main__':
    app.run(debug = con.debug ,port=con.port , host = con.host) 