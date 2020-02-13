# -*- coding: utf-8 -*-

from datetime import datetime
import processes_DB


class Header():
    def __init__(self):
        self.data = dict()
        self.show_data = processes_DB.Show_Data()
        self.data['title'] = 'Tabasheer Training Academy'
        self.data['products_categories'] = self.show_data.get_all_categories_item()
        self.data['courses_categories'] = self.show_data.get_all_categories_course()
        self.data['courses'] = self.show_data.get_all_courses()
        self.data['courses_name'] = self.show_data.get_courses_name()

    
class Footer():
    pass


class Home( Header ):
    def __init__(self) :
        super().__init__()
        
        self.data ['offers_Of_courses'] = self.show_data.get_offer_by_courses()
        self.data ['offers_Of_produts']= self.show_data.get_offer_by_produts()



class Courses(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Courses'


class Login(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Login'


class Achievements(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Achievements'


class Dashboard(Header):
    def __init__(self):
        super().__init__()


class Sinup(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Sinup'
        self.data['Cities'] = self.show_data.get_all_cities()
    def Regiter(self , **info):
        self.insert_data = processes_DB.Register_And_login()
        self.insert_data.Register_func(**info)



class About(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'About Us'


class FAQ(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Frequent Asked Question'


class ForgottenPassword(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Restore password'




