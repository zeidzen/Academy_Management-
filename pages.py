# -*- coding: utf-8 -*-

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
        self.show_data = processes_DB.Show_Data ()
        self.data ['title'] ='Tabasheer Training Academy'
        self.data ['products_categories'] =self.show_data.get_all_categories_item()
        self.data ['courses_categories'] = self.show_data.get_all_categories_course()
        self.data ['courses'] = self.show_data.get_all_courses()
        
        
    
class Footer():
    pass

class Home (Header)  : 
    def __init(self) : 
        super().__init__()



class Courses (Header) : 
    def __init__(self) : 
        super().__init__()
        self.data ['title'] = 'Courses' 
        
        
        
class Login (Header) : 
    def __init__(self) : 
        super().__init__()
        self.data ['title'] = 'Login'
        
        
class Achievements (Header) : 
    def __init__(self) : 
        super().__init__()
        self.data ['title'] = 'Achievements'
        
class Dashboard (Header) : 
    def __init__(self) : 
        super().__init__()
        
        
class Sinup (Header) : 
    def __init__(self) : 
        super().__init__()
        self.data ['title'] = 'Sinup'
        
        
class About (Header) : 
    def __init__(self) : 
        super().__init__()
        self.data ['title'] = 'About Us'


class ForgottenPassword (Header): 
    def __init__(self) : 
        super().__init__()
        self.data ['title'] = 'Restore password'
        
        
        
        