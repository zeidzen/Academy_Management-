# -*- coding: utf-8 -*-

import processes_DB
import math
from werkzeug.utils import secure_filename
import os
from flask import Flask, request, url_for, redirect, session, jsonify, flash
# -----------------------------------------------------------------------------
# Header class
# -----------------------------------------------------------------------------
class Header():
    def __init__(self):
        
        self.data = dict()
        self.show_data = processes_DB.Show_Data()
        self.insert_data = processes_DB.insert_data()
        self.register_user = processes_DB.Register_And_login()
        self.delete_data = processes_DB.delete_data ()
        self.data['title'] = 'Tabasheer Training Academy'        
        self.data['Products_Categories'] = self.show_data.get_all_categories_for_products()

        
    def Show_Data_User  (self , Id_User ) : 
        self.data['User'] = self.show_data.get_info_user_by_Id(Id_User)
        
    def Add_category(self, **info):
        self.insert_data.add_category(**info)
        
    def Del_category(self, Id_category: int):
        return self.delete_data.delete_category_by_Id(Id_category)
    
    def update_category(self, **info):
        return self.update_data.Update_info_category(**info)
        
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

# -----------------------------------------------------------------------------
# Footer class
# -----------------------------------------------------------------------------
class Footer():
    pass

# -----------------------------------------------------------------------------
# Home class
# -----------------------------------------------------------------------------
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
# Courses
# -----------------------------------------------------------------------------
class Courses(Header):
    def __init__(self):
        super().__init__()
        self.data['Courses_Categories'] = self.show_data.get_all_categories_for_course()
        
    def Show_Data_Courses (self , page=1  ) : 
        
        self.data['title'] = 'Courses'
        self.data['Courses'] = self.show_data.get_all_courses()
        self.data['page'] = int(page)
        self.data['Max_page'] = math.ceil(len(self.data['Courses']) / 5)
        self.data['Most_Watched'] = self.show_data.get_top_viewed_item()
        
    def Show_Courses_Category (self, Id_Category: int, Page: int) : 

        self.data['Category_Name'] = self.show_data.get_category_by_Id(Id_Category)[1]
        self.data['Courses'] = self.show_data.get_all_courses_by_category(Id_Category)
        self.data['page'] = int(Page)
        self.data['Max_page'] = math.ceil(len(self.data['Courses']) / 5)
        self.data['title'] = 'Courses : {}'.format(self.data['Category_Name'])
        self.data['Courses_Categories'] = self.show_data.get_all_categories_for_course()
        self.data['Most_Watched'] = self.show_data.get_top_viewed_courses()
        self.data['Id_Category'] = Id_Category
        
        # self.data['Category_Name'] = self.show_data.get_category_by_Id(Id_Category)[1]
        # self.data['Category_path'] = 'Categories    >    {}'.format(self.data['Category_Name'])
        # self.data['Link_Page'] = '/category={}/page='.format(Id_Category)
        
    def Show_Details_Course (self, Id_Course: int) : 
        
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


    def add_courses(self, **info):
        self.insert_data.add_course(**info)
        

    def add_feautre(self, **info):
        self.insert_data.add_feautre_courses(**info)
        
    def add_media (self  ) : 
           pass
       
    def Del_course(self, Id_Course: int):
        return self.delete_data.delete_course_by_Id(Id_Course)
    
    
    def update_course(self, **info):
        return self.update_data.Update_info_course(**info)
    
# -----------------------------------------------------------------------------
# Products class
# -----------------------------------------------------------------------------
class Products(Header):
        
    def __init__(self, page=1, sort=0, Number_Products_In_Page=9):
        super().__init__()
        self.Number_Of_Products_List = [9, 12, 15, 18, 21, 24, 48, 100]
        
        self.Sort_List = {0: 'Default', 1: 'Name( A - Z )', 2: 'Name ( Z - A )',
                 3: 'Price (Low &gt; High)', 4: 'Price (High &gt; Low)'} 
        
    def Show_Data_Products (self, page=1, sort=0, Number_Products_In_Page=9) : 
        self.data['all_products'] = self.show_data.get_all_products(sort)
        self.data['Most_Watched'] = self.show_data.get_top_viewed_item()
        self.data['page'] = int(page)
        self.data['Max_Page'] = math.ceil(len(self.data['all_products']) / Number_Products_In_Page)
        self.data['Number_Products_In_Page'] = Number_Products_In_Page
        self.data['Sort_List'] = self.Sort_List
        self.data['Selected_Sort'] = self.Sort_List[sort]
        self.data['Number_Of_Products'] = self.Number_Of_Products_List
        self.data['Method_Sort'] = sort

        if len(self.data['all_products']) <= 9:
            self.data['Number_Products_In_Page'] = len(self.data['all_products'])

        self.data['layer'] = int(math.ceil(self.data['Number_Products_In_Page'] / 3))


    def Show_Category_Products (self, Id_Category, page=1, sort=0, Number_Products_In_Page=9) : 
        
        self.data['Id_Category'] = Id_Category
        self.data['all_products'] = self.show_data.get_all_products_by_category(Id_Category, sort)
        self.data['Most_Watched'] = self.show_data.get_top_viewed_item()
        self.data['page'] = int(page)
        self.data['Max_Page'] = math.ceil(len(self.data['all_products']) / Number_Products_In_Page)
        self.data['Number_Products_In_Page'] = Number_Products_In_Page
        self.data['Sort_List'] = self.Sort_List
        self.data['Selected_Sort'] = self.Sort_List[sort]
        self.data['Number_Of_Products'] = self.Number_Of_Products_List
        self.data['Method_Sort'] = sort
        if len(self.data['all_products']) <= 9:
            self.data['Number_Products_In_Page'] = len(self.data['all_products'])
        self.data['layer'] = int(math.ceil(self.data['Number_Products_In_Page'] / 3))

    
    def show_details_Product (self, Id_Product: int) : 
        
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
        
    def Add_Product (self, **info):
        return self.insert_data.add_product(**info)
    
    def Del_product(self, Id_Product: int):
        return self.delete_data.delete_product_by_Id(Id_Product)
    
    def update_product(self, **info):
        return self.update_data.Update_info_item(**info)
    
# -----------------------------------------------------------------------------
# Search class
# ----------------------------------------------------------------------------
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
# Achievements 
# ----------------------------------------------------------------------------
class Achievements(Header):
    def __init__(self, page=1):
        super().__init__()

    def Show_Data_Achievements (self, page=1) :
        self.data['title'] = 'Achievements'
        self.data['posts'] = self.show_data.get_all_posts(1)
        self.data['page'] = int(page)
        self.data['Max_page'] = math.ceil(len(self.data['posts']) / 5)
        self.data['Most_Watched'] = self.show_data.get_top_viewed_item()
        
    def Show_Data_Posts (self, page=1) :
        self.data['title'] = 'Posts'
        self.data['posts'] = self.show_data.get_all_posts(2)
        self.data['page'] = int(page)
        self.data['Max_page'] = math.ceil(len(self.data['posts']) / 5)
        self.data['Most_Watched'] = self.show_data.get_top_viewed_item()
        
    def Show_Details_Achievement (self, Id_Post: int):
        self.data['post'] = self.show_data.get_post_by_id(Id_Post)
        self.data['Most_Watched'] = self.show_data.get_top_viewed_item()
        
    def Add_Achievement (self, **info):
        self.insert_data.add_post(**info)        
        
    def Del_post(self, Id_post: int):
        return self.delete_data.delete_post_by_Id(Id_post)


# ----------------------------------------------------------------------------
# About 
# ----------------------------------------------------------------------------
class About(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'About Us'

# ----------------------------------------------------------------------------
# Dashboard 
# ------------------------------------------------------------------------------
class Dashboard(Header):
    def __init__(self , Id_User):
        super().__init__()
        self.data['title'] = 'Dash Board'
        self.data['Today_Sales'] = self.show_data.get_value_payments_today()
        self.data['Monthly_Payments'] = self.show_data.get_value_monthly_payments()
        self.data['Number_Student'] = self.show_data.get_number_all_student()
        self.data['Number_Courses'] = self.show_data.get_number_all_courses()
        self.data['Number_Classes'] = self.show_data.get_number_all_classes()
        self.data['Number_Products'] = self.show_data.get_number_all_products()
        self.data['Number_Offers'] = self.show_data.get_number_all_offers()
        self.data['User'] = self.show_data.get_info_user_by_Id(Id_User)
        self.data['Number_Students_Per_Course'] = self.show_data.Number_students_per_course()
        self. data ['Number_Students_Per_Class'] = self.show_data.number_students_per_class ()
# ----------------------------------------------------------------------------
# Users
# ------------------------------------------------------------------------------
class Users (Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'My Account'
        self.data['Cities'] = self.show_data.get_all_cities()
                
        
    def login(self, **info):
        return self.register_user.Login_func(**info)    
       
    def Add_User(self, **info):
        return self.register_user.Register_func(**info)
   
    def ForgottenPassword (self):
       pass
             
# -----------------------------------------------------------------------------
# Add Student class
# -----------------------------------------------------------------------------
class Students (Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Add Student'
        self.data['Cities'] = self.show_data.get_all_cities()
        self.data['University'] = self.show_data.get_all_universities()
        self.data['Specialization'] = self.show_data.get_all_specialization()

    def Add_students(self, **info):
        self.insert_data.add_student(**info)
        
    def Show_Data_Students (self) : 
        self.data['student'] = self.show_data.get_all_students()
        
    def Del_student(self, Id_Student: int):
        return self.delete_data.delete_Student_by_Id(Id_Student)

# -----------------------------------------------------------------------------
# Classes
# -----------------------------------------------------------------------------
class Classes (Header):
    def __init__(self ):
        super().__init__()
        self.data['title'] = 'Add Classes'
        self.data['Courses_Class'] = self.show_data.get_all_courses()
        self.data['all_classes'] = self.show_data.get_all_classes()
        self.data['all_students'] = self.show_data.get_all_students()

    def Add_class(self, **info):
        self.insert_data.add_class(**info)

    def Add_stu_class(self, **info):
        self.insert_data.add_student_to_class(**info)
                
    def Show_Data_Classes (self) : 
        self.data['classes'] = self.show_data.get_all_classes()
        
    def Del_class(self, Id_Class: int):
        return self.delete_data.delete_classes_by_Id(Id_Class)

    def Update_classes(self, **info):
        return self.update_data.Update_info_classes(**info)
    
# -----------------------------------------------------------------------------
#  OFFERS
# -----------------------------------------------------------------------------
class Offers (Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Add Offers'
        self.data['product'] = self.show_data.get_all_products_without_offers()

    def Add_Offers(self, **info):
        self.insert_data.add_offer(**info)

    def Show_Offers_Curses (self) : 
        self.data['course_offer'] = self.show_data.get_offer_by_courses()
        
    def Show_Offers_Products (self) : 
        self.data['product_offer'] = self.show_data.get_offer_by_produts()
        
# -----------------------------------------------------------------------------
# PAYMENTS
# -----------------------------------------------------------------------------
class Payments (Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Add Payment'
        self.data['student'] = self.show_data.get_all_students()

    def Add_Payment(self, **info):
        self.insert_data.add_payment(**info)

    def Show_Data_Payments (self) :
        self.data['payment'] = self.show_data.get_payment()
               
# -----------------------------------------------------------------------------     
# City_Uni_Spel
# -----------------------------------------------------------------------------        
class City_Uni_Spel(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Add City Uni Spec'

    def add_city(self, **info):
        self.insert_data.add_city(**info)

    def add_university(self, **info):
        self.insert_data.add_university(**info)

    def add_specializaton(self, **info):
        self.insert_data.add_specialization(**info)

# -----------------------------------------------------------------------------     
# Error class
# -----------------------------------------------------------------------------     
class Error_page(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'The requested page does not exist'