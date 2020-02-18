# -*- coding: utf-8 -*-

import processes_DB
import math
from flask import Flask, request
from werkzeug.utils import secure_filename
import os


# ==============================================================================
# ==============================================================================
# ==============================================================================
# Header class
class Header():
    def __init__(self):
        self.data = dict()
        self.show_data = processes_DB.Show_Data()
        self.insert_data = processes_DB.insert_data()
        self.register_user = processes_DB.Register_And_login()
        self.data['title'] = 'Tabasheer Training Academy'
        self.data['products_categories'] = self.show_data.get_all_categories_for_products()
        self.data['courses'] = self.show_data.get_all_courses()
        self.data['categories'] = self.show_data.get_all_categories_for_products()

    def Check_Image_Extenstion(self, filename):
        ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'])
        return '.' in filename and \
               filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


# -----------------------------------------------------------------------------

# Footer class
class Footer():
    pass


# ==============================================================================
# -----------------------------------------------------------------------------
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


# -----------------------------------------------------------------------------
# Courses class
# -----------------------------------------------------------------------------

class Courses(Header):
    def __init__(self, page=1):
        super().__init__()
        self.data['title'] = 'Courses'
        self.data['Courses'] = self.show_data.get_all_courses()
        self.data['page'] = int(page)
        self.data['Max_page'] = math.ceil(len(self.data['Courses']) / 5)
        self.data['Courses_Categories'] = self.show_data.get_all_categories_for_course()


# -----------------------------------------------------------------------------
# Category class
# -----------------------------------------------------------------------------

class Courses_Category(Header):
    def __init__(self, Id_Category: int, Page: int):
        super().__init__()
        self.data['Category_Name'] = self.show_data.get_category_by_Id(Id_Category)[1]
        self.data['Courses'] = self.show_data.get_all_courses_by_category(Id_Category)
        self.data['page'] = int(Page)
        self.data['Max_page'] = math.ceil(len(self.data['Courses']) / 5)
        self.data['title'] = 'Courses : {}'.format(self.data['Category_Name'])
        self.data['Courses_Categories'] = self.show_data.get_all_categories_for_course()

        # self.data['Most_Watched'] = self.show_data.get_top_viewed_courses()
        # self.data['Category_Name'] = self.show_data.get_category_by_Id(Id_Category)[1]
        # self.data['Id_Category'] = Id_Category
        # self.data['Category_path'] = 'Categories    >    {}'.format(self.data['Category_Name'])
        # self.data['page'] = Page
        # self.data['Max_page'] = math.ceil(len(self.data['Courses']) / 9)
        # self.data['Link_Page'] = '/category={}/page='.format(Id_Category)
        # self.data['title'] = self.data['Category_Name']


# -----------------------------------------------------------------------------
# Course class
# -----------------------------------------------------------------------------

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
            self.show_data.get_category_by_id_course(Id_Course))


# -----------------------------------------------------------------------------
# Products class
# -----------------------------------------------------------------------------
class Products(Header):
    global Sort_List
    Sort_List = {0: 'Default', 1: 'Name( A - Z )', 2: 'Name ( Z - A )',
                 3: 'Price (Low &gt; High)', 4: 'Price (High &gt; Low)'}

    Number_Of_Products_List = [9, 12, 15, 18, 21, 24, 48, 100]

    def __init__(self, page=1, sort=0, Number_Products_In_Page=9):
        super().__init__()
        self.data['all_products'] = self.show_data.get_all_products(sort)
        self.data['Most_Watched'] = self.show_data.get_top_viewed_item()
        self.data['page'] = int(page)
        self.data['Max_Page'] = math.ceil(len(self.data['all_products']) / Number_Products_In_Page)
        self.data['Number_Products_In_Page'] = Number_Products_In_Page
        self.data['Sort_List'] = Sort_List
        self.data['Selected_Sort'] = Sort_List[sort]
        self.data['Number_Of_Products'] = Products.Number_Of_Products_List
        self.data['Method_Sort'] = sort

        if len(self.data['all_products']) <= 9:
            self.data['Number_Products_In_Page'] = len(self.data['all_products'])

        self.data['layer'] = int(math.ceil(self.data['Number_Products_In_Page'] / 3))

    # -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# Category class
class Category_Products(Header):
    global Sort_List
    Sort_List = {0: 'Default', 1: 'Name( A - Z )', 2: 'Name ( Z - A )',
                 3: 'Price (Low &gt; High)', 4: 'Price (High &gt; Low)'}

    Number_Of_Products_List = [9, 12, 15, 18, 21, 24, 48, 100]

    def __init__(self, Id_Category, page=1, sort=0, Number_Products_In_Page=9):
        super().__init__()
        self.data['Id_Category'] = Id_Category
        self.data['all_products'] = self.show_data.get_all_products_by_category(Id_Category, sort)
        self.data['Most_Watched'] = self.show_data.get_top_viewed_item()
        self.data['page'] = int(page)
        self.data['Max_Page'] = math.ceil(len(self.data['all_products']) / Number_Products_In_Page)
        self.data['Number_Products_In_Page'] = Number_Products_In_Page
        self.data['Sort_List'] = Sort_List
        self.data['Selected_Sort'] = Sort_List[sort]
        self.data['Number_Of_Products'] = Products.Number_Of_Products_List
        self.data['Method_Sort'] = sort
        if len(self.data['all_products']) <= 9:
            self.data['Number_Products_In_Page'] = len(self.data['all_products'])
        self.data['layer'] = int(math.ceil(self.data['Number_Products_In_Page'] / 3))

    # -----------------------------------------------------------------------------


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
            self.show_data.get_category_by_id_product(Id_Product))


# -----------------------------------------------------------------------------
# Search class
class Search(Header):
    def __init__(self, Name_Search: str, page=1):
        super().__init__()
        self.data['all_Items'] = self.show_data.search_items(Name_Search)
        self.data['Most_Watched'] = self.show_data.get_top_viewed_item()
        self.data['page'] = int(page)
        self.data['Max_page'] = math.ceil(len(self.data['all_Items']) / 9)
        self.data['title'] = 'Search : {} '.format(Name_Search)
        self.data['Name_Search'] = Name_Search


# -----------------------------------------------------------------------------
# Achievements class
class Achievements(Header):
    def __init__(self, page=1):
        super().__init__()
        self.data['title'] = 'Achievements'
        self.data['posts'] = self.show_data.get_all_posts()
        self.data['page'] = int(page)
        self.data['Max_page'] = math.ceil(len(self.data['posts']) / 5)


# -----------------------------------------------------------------------------
# Post class
class Post(Header):
    def __init__(self, Id_Post: int):
        super().__init__()
        self.data['post'] = self.show_data.get_post_by_id(Id_Post)
    # -----------------------------------------------------------------------------


# About class
class About(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'About Us'


# -----------------------------------------------------------------------------
# FAQ class
class FAQ(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Frequent Asked Question'


# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================

# ----------------------------------------------------------------------------
# Dashboard Header
# ------------------------------------------------------------------------------
class DB_Header():
    def __init__(self, Id_User):
        self.data = dict()
        self.show_data = processes_DB.Show_Data()
        self.insert_data = processes_DB.insert_data()
        self.register_user = processes_DB.Register_And_login()
        self.data['title'] = 'Dash Bowrd Tabasheer Training Academy'
        self.data['User'] = self.show_data.get_info_user_by_Id(Id_User)

    def Check_Image_Extenstion(self, filename):
        ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'])
        return '.' in filename and \
               filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

    def Uploud_Image(self, folder, image):
        if image.filename == '':
            if 'course' in folder:
                return '../static/img/defult_image/course.png'
            elif 'product' in folder:
                return '../static/img/defult_image/product.png'
            elif '' in folder:
                return '../static/img/defult_image/Teachable-courses.png'
            else:
                return
        else:

            app = Flask(__name__)
            app.config['UPLOAD_FOLDER'] = folder
            if image and self.Check_Image_Extenstion(image.filename):
                filename = secure_filename(image.filename)
                image.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))

            path = '../' + folder + image.filename.replace(' ', '_')
            return path


# ----------------------------------------------------------------------------
# Dashboard class
# ------------------------------------------------------------------------------

class Dashboard(DB_Header):
    def __init__(self, Id_User):
        super().__init__(Id_User)
        self.data['title'] = 'Dash Board'
        self.data['Today_Sales'] = self.show_data.get_value_payments_today()
        self.data['Monthly_Payments'] = self.show_data.get_value_monthly_payments()
        self.data['Number_Student'] = self.show_data.get_number_all_student()
        self.data['Number_Courses'] = self.show_data.get_number_all_courses()
        self.data['Number_Classes'] = self.show_data.get_number_all_classes()
        self.data['Number_Products'] = self.show_data.get_number_all_products()
        self.data['Number_Offers'] = self.show_data.get_number_all_offers()



# ----------------------------------------------------------------------------
# Account
# ------------------------------------------------------------------------------

class Account(DB_Header):
    def __init__(self, Id_User):
        super().__init__(Id_User)
        self.data['title'] = 'My Account'
        self.data['User'] = self.show_data.get_info_user_by_Id(Id_User)


# ------------------------------------------------------------------------------
# Login class
# ------------------------------------------------------------------------------

class Login(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Login'

    def get_login(self, **info):
        return self.register_user.Login_func(**info)


# -----------------------------------------------------------------------------
# Signup class
class Signup(DB_Header):
    def __init__(self, Id_User):
        super().__init__(Id_User)
        self.data['title'] = 'Sinup'
        self.data['Cities'] = self.show_data.get_all_cities()

    def Regiter(self, **info):
        return self.register_user.Register_func(**info)


# -----------------------------------------------------------------------------
# Add category class
class Add_Category(DB_Header):
    def __init__(self, Id_User):
        super().__init__(Id_User)
        self.data['title'] = 'Add Category'

    def Add_category(self, **info):
        self.insert_data.add_category(**info)


# -----------------------------------------------------------------------------
# Item class
class Add_Item(DB_Header):
    def __init__(self, Id_User):
        super().__init__(Id_User)
        self.data['title'] = 'Add Items'
        self.data['Category'] = self.show_data.get_all_categories_for_products()

    def Add_items(self, **info):
        return self.insert_data.add_product(**info)


# -----------------------------------------------------------------------------
# Add Student class
class Add_Student(DB_Header):
    def __init__(self, Id_User):
        super().__init__(Id_User)
        self.data['title'] = 'Add Student'
        self.data['Cities'] = self.show_data.get_all_cities()
        self.data['University'] = self.show_data.get_all_universities()
        self.data['Specialization'] = self.show_data.get_all_specialization()

    def Add_students(self, **info):
        self.insert_data.add_student(**info)


# -----------------------------------------------------------------------------
# Classes class
class Add_Classes(DB_Header):
    def __init__(self, Id_User):
        super().__init__(Id_User)
        self.data['title'] = 'Add Classes'
        self.data['Courses_Class'] = self.show_data.get_all_courses()

    def Add_class(self, **info):
        self.insert_data.add_class(**info)


# -----------------------------------------------------------------------------
# Add Student To Class
class Add_Student_Class(DB_Header):
    def __init__(self, Id_User):
        super().__init__(Id_User)
        self.data['title'] = 'Add Student to Class'
        self.data['all_classes'] = self.show_data.get_all_classes()
        self.data['all_student'] = self.show_data.get_all_students()

    def Add_stu_class(self, **info):
        self.insert_data.add_student_to_class(**info)


# -----------------------------------------------------------------------------

# Add Course
class Add_Course(DB_Header):
    def __init__(self, Id_User):
        super().__init__(Id_User)
        self.data['title'] = 'Add Course'
        self.data['Courses_Categories'] = self.show_data.get_all_categories_for_course()
        self.data['courses'] = self.show_data.get_all_courses()


    def add_courses(self, **info):
        self.insert_data.add_course(**info)
# -----------------------------------------------------------------------------
# Add Post
class Add_Post(DB_Header):
    def __init__(self, Id_User):
        super().__init__(Id_User)
        self.data['title'] = 'Add Post'


    def add_posts(self, **info):
        self.insert_data.add_post(**info)


# -----------------------------------------------------------------------------
# Add offer
class Add_Offer(DB_Header):
    def __init__(self, Id_User):
        super().__init__(Id_User)
        self.data['title'] = 'Add Offers'
        self.data['product'] = self.show_data.get_all_product()

    def add_offers(self, **info):
        self.insert_data.add_offer(**info)


# -----------------------------------------------------------------------------
# Add Post
class Add_Payment(DB_Header):
    def __init__(self, Id_User):
        super().__init__(Id_User)
        self.data['title'] = 'Add Payment'
        self.data['student'] = self.show_data.get_all_students()


    def add_payments(self, **info):
        self.insert_data.add_payment(**info)


# -----------------------------------------------------------------------------
# Add Post
class Add_City_Uni_Spel(DB_Header):
    def __init__(self, Id_User):
        super().__init__(Id_User)
        self.data['title'] = 'Add City Uni Spec'

    def add_city(self, **info):
        self.insert_data.add_city(**info)

    def add_university(self, **info):
        self.insert_data.add_university(**info)

    def add_specializaton(self, **info):
        self.insert_data.add_specialization(**info)


# -----------------------------------------------------------------------------
# Add Feautre
class Add_Feautre(Header):
    def __init__(self):
        super().__init__()

    def add_feautre(self, **info):
        self.insert_data.add_feautre(**info)


# -----------------------------------------------------------------------------
# ForgottenPassword class
class ForgottenPassword(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Restore password'


# -----------------------------------------------------------------------------
# display Data
# -----------------------------------------------------------------------------
# Student Data
class Display_Student(DB_Header):
    def __init__(self, Id_User):
        super().__init__(Id_User)
        self.data['title'] = 'Add Student'
        self.data['student'] = self.show_data.get_all_students()


# -----------------------------------------------------------------------------
# ==============================================================================
# ==============================================================================
# ==============================================================================
# Error class
class Error_page(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'The requested page does not exist'