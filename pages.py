# -*- coding: utf-8 -*-

from datetime import datetime
from flask import Flask, request, jsonify
import processes_DB
from flask import session
import processes_DB
import math


# Header class
class Header():
    def __init__(self):
        self.data = dict()
        self.show_data = processes_DB.Show_Data()
        self.insert_data = processes_DB.insert_data()
        self.register_user = processes_DB.Register_And_login()
        self.data['title'] = 'Tabasheer Training Academy'
        self.data['products_categories'] = self.show_data.get_all_categories_item()
        self.data['courses_categories'] = self.show_data.get_all_categories_course()
        self.data['courses'] = self.show_data.get_all_courses()
        self.data['courses_name'] = self.show_data.get_courses_name()
        self.data['categories'] = self.show_data.get_all_categories_item()

    def Check_Image_Extenstion(self,filename):
        ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'])
        return '.' in filename and \
               filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


# Footer class
class Footer():
    pass


# Home class
class Home(Header):
    def __init__(self):
        super().__init__()
        self.data['offers_Of_courses'] = self.show_data.get_offer_by_courses()
        self.data['offers_Of_produts'] = self.show_data.get_offer_by_produts()
        self.data['last_ten_Products'] = self.show_data.get_last_ten_Products()
        self.data['all_courses'] = self.show_data.get_all_courses()
        self.data['products_by_categories'] = self.show_data.get_all_products_by_category(2)
        self.data['products_by_Robotics_Kits'] = self.show_data.get_all_products_by_category(11)
        self.data['products_by_Arduino'] = self.show_data.get_all_products_by_category(8)
        self.data['Most_Watched'] = self.show_data.get_top_viewed_item()
        self.data['last_five_posts'] = self.show_data.get_last_number_posts(5)


# Courses class
class Courses(Header):
    def __init__(self, page=1):
        super().__init__()
        self.data['title'] = 'Courses'
        self.data['Courses'] = self.show_data.get_all_courses()
        self.data['Category_path'] = 'All Courses'
        self.data['page'] = int(page)
        self.data['Max_page'] = math.ceil(len(self.data['Courses']) / 5)

    def add_courses(self, **info):
        self.insert_data.add_course(**info)


# Category class
class Courses_Category(Header):
    def __init__(self, Id_Category: int, Page: int):
        super().__init__()
        self.data['Courses'] = self.show_data.get_all_courses_by_category(Id_Category)
        self.data['Most_Watched'] = self.show_data.get_top_viewed_courses()
        self.data['Category_Name'] = self.show_data.get_category_by_Id(Id_Category)[1]
        self.data['Id_Category'] = Id_Category
        self.data['Category_path'] = 'Categories    >    {}'.format(self.data['Category_Name'])
        self.data['page'] = Page
        self.data['Max_page'] = math.ceil(len(self.data['Courses']) / 9)
        self.data['Link_Page'] = '/category={}/page='.format(Id_Category)
        self.data['title'] = self.data['Category_Name']


# Products class
class Products(Header):
    def __init__(self , page ):
        super().__init__()
        self.data ['all_products'] = self.show_data.get_all_products()
        self.data ['Most_Watched'] = self.show_data.get_top_viewed_item()
        self.data ['page'] = int(page)
        self.data ['Max_page'] = math.ceil(len(self.data['all_products'])/9)
        self.data ['Link_Page'] = '/products/page='
        self.data ['Category_path'] = 'All Products'
        self.data ['Category_Name'] = 'All Products'
        self.data ['title'] = 'Products'


# Category class
class Category(Header):
    def __init__(self, Id_Category: int, Page: int):
        super().__init__()
        self.data['all_products'] = self.show_data.get_all_products_by_category(Id_Category)
        self.data['Most_Watched'] = self.show_data.get_top_viewed_item()
        self.data['Category_Name'] = self.show_data.get_category_by_Id(Id_Category)[1]
        self.data['Id_Category'] = Id_Category
        self.data['Category_path'] = 'Categories    >    {}'.format(self.data['Category_Name'])
        self.data['page'] = Page
        self.data['Max_page'] = math.ceil(len(self.data['all_products']) / 9)
        self.data['Link_Page'] = '/category={}/page='.format(Id_Category)
        self.data['title'] = self.data['Category_Name']


# Search class
class Search(Header):
    def __init__(self, Search: str, page = 1 ):
        super().__init__()
        self.data ['all_products'] = self.show_data.search_item(Search)
        self.data ['Most_Watched'] = self.show_data.get_top_viewed_item()
        self.data ['page'] =int (page)
        self.data ['Max_page'] = math.ceil ( len (self.data ['all_products'])/9)
        self.data ['Link_Page'] = '/search/page='
        self.data ['Category_path'] = 'Search : {} '.format (Search)
        self.data ['Category_Name'] = 'Search : {} '.format (Search)
        self.data ['title'] = 'Search : {} '.format(Search)


# Product class
class Product(Header):
    def __init__(self, Id_Product: int):
        super().__init__()
        self.data['check_offer_existe'] = self.show_data.check_offer_existe(Id_Product)

        if self.data['check_offer_existe'] == True:

            self.data['Product'] = self.show_data.get_offer_by_id_produt(Id_Product)

        elif self.data['check_offer_existe'] == False:
            self.data['Product'] = self.show_data.get_product_by_Id(Id_Product)

        self.data['Title'] = self.data['Product']['Name']
        self.data['Media'] = self.show_data.get_media_by_id_product(Id_Product)
        self.data['Features'] = self.show_data.get_features_by_id_product(Id_Product)
        if len(self.data['Media']) + 1 > 4:
            self.data['Number_Medias'] = 4
        else:
            self.data['Number_Medias'] = len(self.data['Media']) + 1
        self.data['Most_Watched'] = self.show_data.get_top_viewed_item()

        self.data['Related_Product'] = self.show_data.get_all_products_by_category(
            self.show_data.get_category_by_product(Id_Product))


# Course class
class Course(Header):
    def __init__(self, Id_Course: int):
        super().__init__()
        self.data['check_offer_existe'] = self.show_data.check_offer_existe(Id_Course, 2)

        if self.data['check_offer_existe'] == True:
            self.data['Course'] = self.show_data.get_offer_by_id_course(Id_Course)

        elif self.data['check_offer_existe'] == False:
            self.data['Course'] = self.show_data.get_course_by_Id(Id_Course)

        self.data['Title'] = self.data['Course']['Name']
        self.data['Media'] = self.show_data.get_media_by_id_course(Id_Course)
        self.data['Features'] = self.show_data.get_features_by_id_course(Id_Course)
        if len(self.data['Media']) + 1 > 4:
            self.data['Number_Medias'] = 4
        else:
            self.data['Number_Medias'] = len(self.data['Media']) + 1
        self.data['Most_Watched'] = self.show_data.get_top_viewed_courses()

        self.data['Related_Product'] = self.show_data.get_all_courses_by_category(
            self.show_data.get_category_by_course(Id_Course))


# Login class
class Login(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Login'

    def get_login(self, **info):
        return self.register_user.Login_func(**info)


# Achievements class
class Achievements(Header):
    def __init__(self, page=1):
        super().__init__()
        self.data['title'] = 'Achievements'
        self.data['posts'] = self.show_data.get_all_posts()
        self.data['page'] = int(page)
        self.data['Max_page'] = math.ceil(len(self.data['posts']) / 5)


# Post class
class Post(Header):
    def __init__(self, Id_Post: int):
        super().__init__()
        self.data['post'] = self.show_data.get_post_by_id(Id_Post)


# Dashboard class
class Dashboard(Header):
    def __init__(self):
        super().__init__()


# Signup class
class Signup(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Sinup'
        self.data['Cities'] = self.show_data.get_all_cities()

    def Regiter(self, **info):
        return self.register_user.Register_func(**info)


# category class
class Add_Category(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Add Category'

    def Add_category(self, **info):
        self.insert_data.add_category(**info)


# Item class
class Add_Item(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Add Items'
        self.data['Category'] = self.show_data.get_items_categories()

    def Add_items(self, **info):
        self.insert_data.add_items(**info)


# Student class
class Add_Student(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Add Student'
        self.data['Cities'] = self.show_data.get_all_cities()
        self.data['University'] = self.show_data.get_all_universities()
        self.data['Specialization'] = self.show_data.get_all_specialization()

    def Add_students(self, **info):
        self.insert_data.add_student(**info)


# Classes class
class Add_Classes(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Add Classes'
        self.data['Courses_Class'] = self.show_data.get_all_courses_for_classes()

    def Add_class(self, **info):
        self.insert_data.add_class(**info)


# Student_Class class
class Add_Student_Class(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Add Student to Class'
        self.data['class'] = self.show_data.get_classes_name()
        self.data['student'] = self.show_data.get_student_name()

    def Add_stu_class(self, **info):
        self.insert_data.add_student_to_class(**info)


# About class
class About(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'About Us'


# FAQ class
class FAQ(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Frequent Asked Question'


# ForgottenPassword class
class ForgottenPassword(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Restore password'


# Error class
class Error_page (Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'The requested page does not exist'