# -*- coding: utf-8 -*-
"""
Created on Mon Nov 25 13:06:01 2019

@author: zeidz
"""

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
def Home_page(): 
    Home_class = pages.Home ()
    return render_template ('home-1-rtl.html',data = Home_class.data )
     



if __name__ == '__main__':
    app.run(debug = con.debug ,port=con.port , host = con.host) 