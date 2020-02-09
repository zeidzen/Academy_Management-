
import database as db
import hashlib, binascii
import re
import os
# -*- coding: utf-8 -*-


class Show_Data():
    def __init__(self):
        self.con = db.DataBase()
    
    #Items
    def get_all_items(self) -> list:
        item = list()
        sql = """select Name, Description, Price, Date  from items;"""
        data = self.con.Select_Data_More_Row(sql)
        for items in data:
            selected = dict()
            selected['Name'] = items[0]
            selected['Description'] = items[1]
            selected['Price'] = items[2]
            selected['Date'] = items[3]
            item.append(selected)
        return item



    def search_item(self, name: str) -> list:
        item = list()
        sql = "select Name, Description, Price, Date  from items where Name LIKE '%{}%' ;".format(name)
        data = self.con.Select_Data_More_Row(sql)
        for items in data:
            selected = dict()
            selected['Name'] = items[0]
            selected['Description'] = items[1]
            selected['Price'] = items[2]
            selected['Date'] = items[3]
            item.append(selected)
        return item



    def get_all_categories_item (self) -> list:
        category = list()
        sql = """select Name  from Categories where Type = 1;"""
        data = self.con.Select_Data_More_Row(sql)
        for cat in data:
            select = dict()
            select['Name'] = cat[0]
            category.append(select)
        return category


    #courses
    def get_all_courses(self) -> list:
        courses = list()
        sql = """select Name, Description, Image, Price, Number_of_hours, Date  from Courses;"""
        data = self.con.Select_Data_More_Row(sql)
        for items in data:
            selected = dict()
            selected['Name'] = items[0]
            selected['Description'] = items[1]
            selected['Image'] = items[2]
            selected['Price'] = items[3]
            selected['Number_of_hours'] = items[4]
            selected['Date'] = items[5]
            courses.append(selected)
        return courses


    def search_course(self, name: str) -> list:
        courses = list()
        sql = "select Name, Description, Image, Price, Number_of_hours , Date  from Courses where Name LIKE '%{}%' ;".format(
            name)
        data = self.con.Select_Data_More_Row(sql)
        for items in data:
            selected = dict()
            selected['Name'] = items[0]
            selected['Description'] = items[1]
            selected['Image'] = items[2]
            selected['Price'] = items[3]
            selected['Number_of_hours'] = items[4]
            selected['Date'] = items[5]
            courses.append(selected)
        return courses



    def get_all_categories_course (self) -> list:
        category = list()
        sql = """select Name  from Categories where Type = 2 ;"""
        data = self.con.Select_Data_More_Row(sql)
        for cat in data:
            select = dict()
            select['Name'] = cat[0]
            category.append(select)
        return category
    
    
    def get_Top_viewed_courses (self) : 
        sql = """SELECT Name, Description, Image, Price, Number_of_hours , Views , Date 
                FROM courses  ORDER BY  Views DESC ;"""
        courses = self.con.Select_Data_More_Row(sql)
        data =list ()
        for items in courses:
            selected = dict()
            selected['Name'] = items[0]
            selected['Description'] = items[1]
            selected['Image'] = items[2]
            selected['Price'] = items[3]
            selected['Number_of_hours'] = items[4]
            selected['Views'] = items[5]
            selected['Date'] = items[6]
            data.append(selected)
        return data
    
    
    
    
    #Student 
    def search_Students (self, value : str) -> list :    
        sql = """select Id , FirstName , LastName , Gender , Phone , Email , Birthday ,
                 Id_Address , Id_University , Id_Specialization 
                 From students 
                 WHERE FirstName LIKE '%{}%' or LastName LIKE '%{}%' or Phone LIKE '%{}%'
                 or Email LIKE '%{}%' ; """.format(value ,value , value ,value )
                 
        students = self.con.Select_Data_More_Row(sql)
        data = list ()
        for item in students : 
            student = dict()
            student ['Id'] = item[0]
            student ['FirstName'] = item[1]
            student ['LastName'] = item[2]
            student ['Gender'] = item[3]
            student ['Phone'] = item[4]
            student ['Email'] = item[5]
            student ['Birthday'] = item[6]
            student ['Id_Address'] = item[7]
            student ['Id_University'] = item[8]
            student ['Id_Specialization'] = item[9]
            data.append(student)
        return data 
    
    def get_info_student_by_id (self , Id_Student : int ) ->dict : 
        sql = """select FirstName , LastName , Gender , Phone , Email , Birthday ,
        Id_Address , Id_University , Id_Specialization
        From students
        Where  Id = {} ; """.format(Id_Student)
        item = self.con.Select_Data_One_Row(sql)
        data = dict()
        data ['FirstName'] = item[0]
        data ['LastName'] = item[1]
        data ['Gender'] = item[2]
        data ['Phone'] = item[3]
        data ['Email'] = item[4]
        data ['Birthday'] = item[5]
        data ['Id_Address'] = item[6]
        data ['Id_University'] = item[7]
        data ['Id_Specialization'] = item[8]
        return data 
        
    
    def get_all_students (self ) ->list : 
        sql = """select Id ,FirstName , LastName , Gender , Phone , Email , Birthday ,
        Id_Address , Id_University , Id_Specialization
        From students ;"""
        students = self.con.Select_Data_More_Row(sql)
        data = list ()
        for item in students : 
            student = dict()
            student ['Id'] = item[0]
            student ['FirstName'] = item[1]
            student ['LastName'] = item[2]
            student ['Gender'] = item[3]
            student ['Phone'] = item[4]
            student ['Email'] = item[5]
            student ['Birthday'] = item[6]
            student ['Id_Address'] = item[7]
            student ['Id_University'] = item[8]
            student ['Id_Specialization'] = item[9]
            data.append(student)
        return data 
    
    
    #Classes 
    def get_all_classes (self) ->list : 
        sql = """SELECT classes.Id , courses.Name ,classes.Start_Date , classes.End_Date  ,classes.capacity , classes.Lecturer  
                FROM `classes` , courses  WHERE classes.Id_course=courses.Id ; """
        classes = self.con.Select_Data_More_Row(sql)
        data = list ()
        for item in classes : 
            class_ = dict()
            class_ ['Id'] = item[0]
            class_ ['Name'] = item[1]
            class_ ['Start_Date'] = item[2]
            class_ ['End_Date'] = item[3]
            class_ ['capacity'] = item[4]
            class_ ['Lecturer'] = item[5]
            data.append(class_)
        return data 
    
    
    
    #POST
    def get_all_posts(self)-> list:
        post = list()
        sql = """select Title, Content, Media, Date  from post;"""
        data = self.con.Select_Data_More_Row(sql)
        for items in data:
            selected = dict()
            selected['Title'] = items[0]
            selected['Content'] = items[1]
            selected['Media'] = items[2]
            selected['Date'] = items[3]
            post.append(selected)
        return post


class insert_data():
    def __init__(self):
        self.con = db.DataBase()


    def check_Student_exists (self, column : str , value ) -> bool :
        sql="""SELECT count(*) FROM students WHERE {} ='{}' ;""".format(column,value)
        data = self.con.Select_Data_One_Row(sql) 
        if data[0] == 0 : return False
        else : return True

    def add_Student (self ,**info) -> bool :   
        try :
            if self.check_Student_exists( 'Email', info['Email']) == True : 
                return False , 'An email already exists Please enter a new email'
            
            
            Email_Pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
            if re.search( Email_Pattern , info['Email'] )  == True : 
                return False , 'The correct email entry is entered'    
            
            
            if self.check_Student_exists ( 'Phone', info['Phone']) == True : 
                return False , 'Phone number already exists. Please enter a new number'
            
            if info['Phone'][0:3] not in ['079' ,'078' ,'077' ] : 
                return False , 'Phone number is not from the telecommunications service providers in Jordan (Zain, Umniah, Orange).'
            
            self.con.Insert_Data(table='students',**info)
            return True
        
        except : 
            return False , 'A system error occurred, please try again later'
       
        
        
    def add_course (self ,**info) -> bool :   
        try :                        
            self.con.Insert_Data(table='courses',**info)
            return True
        except : 
            return False , 'A system error occurred, please try again later'
        
        
    
    def add_class (self , **info ) ->bool : 
        try :                        
            self.con.Insert_Data(table='classes',**info)
            return True
        except : 
            return False , 'A system error occurred, please try again later'
    
    def add_student_to_class (self , **info) ->bool :
        try :                        
            self.con.Insert_Data(table='stu_class',**info)
            return True
        except : 
            return False , 'A system error occurred, please try again later'
        
    #test    
    def Update_info_Student (self ,**info) -> bool :   
        
            if self.check_Student_exists( 'Email', info['Email']) == False : 
                return False , 'An email already exists Please enter a new email'
            
            Email_Pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
            if re.search( Email_Pattern , info['Email'] )  == True : 
                return False , 'The correct email entry is entered'    
            
            
            if self.check_Student_exists( 'Phone', info['Phone']) == True : 
                return False , 'Phone number already exists. Please enter a new number'
            
            if info['Phone'][:3] not in ['079' ,'078' ,'077' ] : 
                return False , 'Phone number is not from the telecommunications service providers in Jordan (Zain, Umniah, Orange).'
            Id=info ['Id'] 
            del info ['Id'] 
            print (info)
            self.con.Update_Data_All_Coulmn_String ('students', Id , **info )
            return True
#        try :
#        except : 
#            return False , 'A system error occurred, please try again later'
    



    #test    
    def Update_info_course  (self ,**info) -> bool :   
        try :
            #self.con.Update_Data_All_Coulmn_String(table='courses',info['Id'] , **info)
            return True
        except : 
            return False , 'A system error occurred, please try again later'
        
        
    #test    
    def Update_info_classes  (self ,**info) -> bool :   
        try :
            #self.con.Update_Data_All_Coulmn_String(table='classes',info['Id'] , **info)
            return True
        except : 
            return False , 'A system error occurred, please try again later'
    

    
    
class delete_data () : 
    
    def __init__(self):
        self.con = db.DataBase()

    
    def check_student_exists(self, column , value ):
        sql="""SELECT count(*) FROM students WHERE {} ='{}' ;""".format(column,value)
        data = self.con.Select_Data_One_Row(sql)
        print (data)
        if data[0] == 0 : return False
        else : return True
    
    
    def delete_Student_by_Id (self, Id_Student : int ) -> bool :
        try :    
            if self.check_student_exists( 'Id', Id_Student ) == False : 
                return False , 'Student record not found'
            
            self.con.Delete_Data('students' ,'Id' ,Id_Student )
            return True 
        except :
            return False , 'Something went wrong please try again later'


        
    def delete_course_by_Id (self , Id_course : int ) -> bool : 
        try :    
            self.con.Delete_Data('courses' ,'Id' ,Id_course )
            return True 
        except :
            return False , 'Something went wrong please try again later'
        
        
    def delete_classes_by_Id (self , Id_classes : int ) -> bool : 
        try :    
            self.con.Delete_Data('classes' ,'Id' ,Id_classes )
            return True 
        except :
            return False , 'Something went wrong please try again later'
        
        
        
        
class Register_And_login():

    def __init__(self):
        self.con = db.DataBase()

    def hash_password(self,password):
        """Hash a password for storing."""
        salt = hashlib.sha256(os.urandom(60)).hexdigest().encode('ascii')
        pwdhash = hashlib.pbkdf2_hmac('sha512', password.encode('utf-8'),
                                    salt, 100000)
        pwdhash = binascii.hexlify(pwdhash)
        return (salt + pwdhash).decode('ascii')

    def verify_password(self,stored_password, provided_password):
        """Verify a stored password against one provided by user"""
        salt = stored_password[:64]
        stored_password = stored_password[64:]
        pwdhash = hashlib.pbkdf2_hmac('sha512',
                                      provided_password.encode('utf-8'),
                                      salt.encode('ascii'),
                                      100000)
        pwdhash = binascii.hexlify(pwdhash).decode('ascii')
        return pwdhash == stored_password


    def check_user_exists(self, column , value ):
        sql="""SELECT count(*) FROM users WHERE {} ='{}' ;""".format(column,value)
        data = self.con.Select_Data_One_Row(sql)
        print (data)
        if data[0] == 0 : return False
        else : return True

    def register_user(self, fname, lname, email, phone, password, gender, id_address, image, birthday, date):

        data = dict()
        table_name = 'Users'
        data['ID'] = 0
        data['FName'] = fname
        data['LName'] = lname
        data['Email'] = email
        data['Phone'] = phone
        data['Password'] = self.hash_password( password)
        data['Gender'] = gender
        data['ID_Address'] = id_address
        data['Image'] = image
        data['Birthday'] = birthday
        data['Date'] = date

        self.con.Insert_Data(table_name, data)
        return "Data Inserted"

    def login_user(self, in_email, in_password):
        sql = """select Email, Password from users where Email = {} ;""".format(in_email, in_password)

        data = self.con.Select_Data_One_Row(sql)
        passwords = self.verify_password(data[1], in_password)
        for email in data[0]:
            if email == in_email and passwords == True:
                return True
            else:
                return False


show = Show_Data()
insert = insert_data ()
delete= delete_data ()
classes = dict ()
classes ['Id_Student'] = '3'
classes ['Id_Class'] = '3'


student = dict ()
student ['Id'] ='3'
student ['FirstName'] ='ali33'
student ['LastName'] ='ali'
student ['Gender'] ='1'
student ['Phone'] ='0781472596'
student ['Email'] ='ali.ali44@gmail.com'
student ['Birthday'] ='1996-01-10'
student ['Id_Address'] ='3'
student ['Id_University'] ='2'
student ['Id_Specialization'] ='1'
data = insert.Update_info_Student (**student)


