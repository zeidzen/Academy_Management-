# -*- coding: utf-8 -*-
"""
Created on Sun Dec 29 11:40:55 2019

@author: zeidz
"""
from datetime import  datetime
from googletrans import Translator
from flask import Flask, request, jsonify
from bs4 import BeautifulSoup as bs 
import requests
import processes_DB
from flask import session


class Header () : 
    def __init__(self) :
        self.data=dict()
        self.data['title'] ='Tabasheer Training Academy'
        
    
class Footer():
    pass

class Home (Header)  : 
    def __init(self) : 
        super().__init__()



class Courses () : 
    pass 

class Login () : 
    pass 

class Achievements () : 
    pass 

class Dashboard () : 
    pass

class Sinup () : 
    pass 



        
        
        
        
        