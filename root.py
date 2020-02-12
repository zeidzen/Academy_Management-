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

@app.route('/home') 
def Home_Page():
    Home_Class = pages.Home()
    return render_template ('home.html' , data = Home_Class.data ) 
    
@app.route('/login') 
def Login_Page(): 
    Login_Class = pages.Home()
    return render_template ('login.html' , data = Login_Class.data ) 
     

@app.route('/sinup') 
def Sinup_Page(): 
    Sinup_Class = pages.Sinup()
    return render_template ('register.html' , data = Sinup_Class.data ) 

@app.route('/courses') 
def Courses_Page(): 
    pass

@app.route('/achievements') 
def Achievements_Page(): 
    pass

@app.route('/about') 
def About_Page(): 
    About_Class = pages.About()
    return render_template ('about.html' , data = About_Class.data ) 

@app.route('/ForgottenPassword') 
def ForgottenPassword_Page(): 
    pass


@app.route('/TTADP') 
def Dashboard_Page(): 
    pass
    pass



if __name__ == '__main__':
    app.run(debug = con.debug ,port=con.port , host = con.host) 