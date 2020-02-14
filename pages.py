# -*- coding: utf-8 -*-
import processes_DB
import math

class Header():
    def __init__(self):
        self.data = dict()
        self.show_data = processes_DB.Show_Data()
        self.data['title'] = 'Tabasheer Training Academy'
        self.data['products_categories'] = self.show_data.get_all_categories_item()
        self.data['courses_categories'] = self.show_data.get_all_categories_course()
        self.data['courses'] = self.show_data.get_all_courses()
        self.data['courses_name'] = self.show_data.get_courses_name()
        self.data['categories'] = self.show_data.get_all_categories_item()


    
class Footer():
    pass


class Home( Header):
    def __init__ (self) :
        super().__init__()
        self.data ['offers_Of_courses'] = self.show_data.get_offer_by_courses()
        self.data ['offers_Of_produts'] = self.show_data.get_offer_by_produts()
        self.data ['last_ten_Products'] = self.show_data.get_last_ten_Products ()
        self.data ['all_courses'] = self.show_data.get_all_courses()
        self.data ['products_by_categories'] = self.show_data.get_all_products_by_categories(2)
        self.data ['products_by_Robotics_Kits'] = self.show_data.get_all_products_by_categories(11)
        self.data ['products_by_Arduino'] = self.show_data.get_all_products_by_categories(8)
        self.data ['Most_Watched'] = self.show_data.get_top_viewed_item()
        self.data ['last_five_posts'] = self.show_data.get_last_number_posts(5)
        
    
class Courses(Header):
    def __init__(self , page =1 ):
        super().__init__()
        self.data['title'] = 'Courses'
        self.data ['title'] = 'Achievements'
        self.data ['posts'] =self.show_data.get_all_courses()
        self.data ['page'] =int (page)
        self.data ['Max_page'] = math.ceil ( len (self.data ['posts'])/5)
        

class Products(Header):
    def __init__(self , page ):
        super().__init__()
        self.data ['all_products'] = self.show_data.get_all_items()
        self.data ['Most_Watched'] = self.show_data.get_top_viewed_item()
        self.data ['page'] =int (page)
        self.data ['Max_page'] = math.ceil ( len (self.data ['all_products'])/9)
        self.data ['Link_Page'] = '/products/page='
        self.data ['Category_path'] = 'All Products'
        self.data ['Category_Name'] = 'All Products'
        self.data ['title'] = 'Products'

        
class Product(Header):
    def __init__(self , Id_Product : int ):
        super().__init__()
        self.data ['check_offer_existe'] =self.show_data.check_offer_existe (Id_Product)
        
        if  self.data ['check_offer_existe']  == True : 
            
            self.data ['Product'] = self.show_data.get_offer_by_id_produt(Id_Product)
            
        elif  self.data ['check_offer_existe']  == False  :
            self.data ['Product'] = self.show_data.get_product_by_Id(Id_Product)
        
        self.data ['Title'] =self.data ['Product']['Name']
        self.data ['Media']= self.show_data.get_media_by_id_product( Id_Product )
        self.data ['Features']= self.show_data.get_features_by_id_product( Id_Product )
        if len (self.data ['Media']) +1 > 4 : 
            self.data ['Number_Medias'] = 4
        else :
            self.data ['Number_Medias'] = len (self.data ['Media']) +1 
        self.data ['Most_Watched'] = self.show_data.get_top_viewed_item()
        
        self.data ['Related_Product'] = self.show_data.get_all_products_by_categories(self.show_data.get_category_by_product (Id_Product) [0])        
    
        
class Login(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Login'


class Achievements(Header):
    def __init__(self , page =1 ):
        super().__init__()
        self.data ['title'] = 'Achievements'
        self.data ['posts'] =self.show_data.get_all_posts()
        self.data ['page'] =int (page)
        self.data ['Max_page'] = math.ceil ( len (self.data ['posts'])/5)
        
        
class Post (Header):
    def __init__(self , Id_Post : int ):
        super().__init__()
        self.data ['post'] = self.show_data.get_post_by_id(Id_Post) 


class Category (Header) : 
    def __init__(self , Id_Category : int , Page : int  ):
        super().__init__()
        self.data ['all_products'] = self.show_data.get_all_products_by_categories(Id_Category)
        self.data ['Most_Watched'] = self.show_data.get_top_viewed_item()
        self.data ['Category_Name'] =self.show_data.get_category_by_Id(Id_Category)[1]
        self.data ['Id_Category'] = Id_Category
        self.data ['Category_path'] ='Categories    >    {}'.format(self.data ['Category_Name'])
        self.data ['page'] = Page
        self.data ['Max_page'] = math.ceil ( len (self.data ['all_products'])/9)
        self.data ['Link_Page'] = '/category={}/page='.format(Id_Category)
        self.data ['title'] = self.data ['Category_Name']
        
        
class Dashboard(Header):
    def __init__(self):
        super().__init__()


class Sinup(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Sinup'
        self.data['Cities'] = self.show_data.get_all_cities()

    def Regiter(self, **info):
        self.insert_data = processes_DB.Register_And_login()
        self.insert_data.Register_func(**info)


class Add(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Add Category'

    def Add_category(self, **info):
        self.insert_data = processes_DB.insert_data()
        self.insert_data.add_category(**info)


class Add_Items(Header):
    def __init__(self):
        super().__init__()
        self.data['title'] = 'Add Items'

    def Add_items(self, **info):
        self.insert_data = processes_DB.insert_data()
        self.insert_data.add_items(**info)


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




