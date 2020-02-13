
import database as db
import hashlib, binascii
import re
import os
# -*- coding: utf-8 -*-

# All it Work


class Show_Data():
    def __init__(self):
        self.con = db.DataBase()

    # Items
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
        sql = """select Name, Description, Price, Date  from items where Name Like '%{}%';""".format(name)
        data = self.con.Select_Data_More_Row(sql)
        for items in data:
            selected = dict()
            selected['Name'] = items[0]
            selected['Description'] = items[1]
            selected['Price'] = items[2]
            selected['Date'] = items[3]
            item.append(selected)
        return item

    def get_all_categories_item(self) -> list:
        category = list()
        sql = """select Name  from Categories where Type = 1;"""
        data = self.con.Select_Data_More_Row(sql)
        for cat in data:
            select = dict()
            select['Name'] = cat[0]
            category.append(select)
        return category

    def get_top_viewed_item(self) -> list:
        sql = """SELECT Name, Description,  Price, Image, Views , Date 
                FROM items  ORDER BY  Views DESC ;"""
        courses = self.con.Select_Data_More_Row(sql)
        data = list()
        for items in courses:
            selected = dict()
            selected['Name'] = items[0]
            selected['Description'] = items[1]
            selected['Price'] = items[2]
            selected['Image'] = items[3]
            selected['Views'] = items[4]
            selected['Date'] = items[5]
            data.append(selected)
        return data

    def get_top_viewed_item_by_category(self, id_category) -> list:
        sql = """SELECT Name, Description,  Price, Image, Views , Date 
                FROM items where Id_Category = {} ORDER BY  Views DESC ;""".format(id_category)
        courses = self.con.Select_Data_More_Row(sql)
        data = list()
        for items in courses:
            selected = dict()
            selected['Name'] = items[0]
            selected['Description'] = items[1]
            selected['Price'] = items[2]
            selected['Image'] = items[3]
            selected['Views'] = items[4]
            selected['Date'] = items[5]
            data.append(selected)
        return data

    # Courses
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
        sql = """select Name, Description, Image, Price, Number_of_hours, Date  from Courses where Name Like '%{}%';""".format(
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

    def get_top_viewed_courses(self):
        sql = """SELECT Name, Description, Image, Price, Number_of_hours , Views , Date 
                FROM courses  ORDER BY  Views DESC ;"""
        courses = self.con.Select_Data_More_Row(sql)
        data = list()
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

    def get_top_viewed_courses_by_category(self, id_category):
        sql = """SELECT Name, Description, Image, Price, Number_of_hours , Views , Date 
                FROM courses where Id_Category = {} ORDER BY  Views DESC ;""".format(id_category)
        courses = self.con.Select_Data_More_Row(sql)
        data = list()
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

    def get_all_categories_course(self) -> list:
        category = list()
        sql = """select Name  from Categories where Type = 2 ;"""
        data = self.con.Select_Data_More_Row(sql)
        for cat in data:
            select = dict()
            select['Name'] = cat[0]
            category.append(select)
        return category

    def get_courses_name(self):
        courses = list()
        sql = """select Name  from Courses;"""
        data = self.con.Select_Data_More_Row(sql)
        for items in data:
            selected = dict()
            selected['Name'] = items[0]
            courses.append(selected)
        return courses

    # Student

    def search_students(self, value: str) -> list:
        sql = """select st.Id , st.FirstName , st.LastName , st.Gender , st.Phone , st.Email , st.Birthday ,
             c.Name, u.Name , sp.Name
             From students st , city c, university u , specialization sp
             WHERE st.Id_Address = c.Id and st.Id_University = u.Id and st.Id_Specialization = sp.Id and
             FirstName LIKE '%{}%'  ; """.format(value)

        students = self.con.Select_Data_More_Row(sql)
        data = list()
        for item in students:
            student = dict()
            student['Id'] = item[0]
            student['FirstName'] = item[1]
            student['LastName'] = item[2]
            student['Gender'] = item[3]
            student['Phone'] = item[4]
            student['Email'] = item[5]
            student['Birthday'] = item[6]
            student['Address'] = item[7]
            student['University'] = item[8]
            student['Specialization'] = item[9]
            data.append(student)
        return data

    def get_info_student_by_id(self, id_student: int) -> dict:
        sql = """select st.Id , st.FirstName , st.LastName , st.Gender , st.Phone , st.Email , st.Birthday ,
                     c.Name, u.Name , sp.Name
                     From students st , city c, university u , specialization sp
                     WHERE st.Id_Address = c.Id and st.Id_University = u.Id and st.Id_Specialization = sp.Id and
                     st.Id = {}  ; """.format(id_student)

        students = self.con.Select_Data_More_Row(sql)
        data = list()
        for item in students:
            student = dict()
            student['Id'] = item[0]
            student['FirstName'] = item[1]
            student['LastName'] = item[2]
            student['Gender'] = item[3]
            student['Phone'] = item[4]
            student['Email'] = item[5]
            student['Birthday'] = item[6]
            student['Address'] = item[7]
            student['University'] = item[8]
            student['Specialization'] = item[9]
            data.append(student)
        return data

    def get_all_students(self) -> list:
        sql = """select st.Id, st.FirstName , st.LastName , st.Gender , st.Phone , st.Email , st.Birthday ,
           c.Name, u.Name , sp.Name
           From students st , city c, university u , specialization sp
           Where st.Id_Address = c.Id and st.Id_University = u.Id and st.Id_Specialization = sp.Id ;"""
        students = self.con.Select_Data_More_Row(sql)
        data = list()
        for item in students:
            student = dict()
            student['Id'] = item[0]
            student['FirstName'] = item[1]
            student['LastName'] = item[2]
            student['Gender'] = item[3]
            student['Phone'] = item[4]
            student['Email'] = item[5]
            student['Birthday'] = item[6]
            student['Address'] = item[7]
            student['University'] = item[8]
            student['Specialization'] = item[9]
            data.append(student)
        return data

    # Classes
    def get_all_classes(self) -> list:
        sql = """SELECT cl.Id , co.Name, cl.Name ,cl.Start_Date , cl.End_Date  ,cl.capacity , cl.Lecturer  
                   FROM classes cl , courses co 
                    WHERE cl.Id_course=co.Id ; """
        classes = self.con.Select_Data_More_Row(sql)
        data = list()
        for item in classes:
            class_ = dict()
            class_['Id'] = item[0]
            class_['courses_Name'] = item[1]
            class_['class_Name'] = item[2]
            class_['Start_Date'] = item[3]
            class_['End_Date'] = item[4]
            class_['capacity'] = item[5]
            class_['Lecturer'] = item[6]
            data.append(class_)
        return data

    def get_info_class_by_name(self , class_name: str) -> list:
        sql = """SELECT cl.Id , co.Name, cl.Name ,cl.Start_Date , cl.End_Date  ,cl.capacity , cl.Lecturer  
                         FROM classes cl , courses co 
                          WHERE cl.Id_course=co.Id and cl.Name Like '%{}%'; """.format(class_name)
        classes = self.con.Select_Data_More_Row(sql)
        data = list()
        for item in classes:
            class_ = dict()
            class_['Id'] = item[0]
            class_['courses_Name'] = item[1]
            class_['class_Name'] = item[2]
            class_['Start_Date'] = item[3]
            class_['End_Date'] = item[4]
            class_['capacity'] = item[5]
            class_['Lecturer'] = item[6]
            data.append(class_)
        return data

    # Posts
    def get_all_posts(self) -> list:
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

    def get_payment(self) -> list:
        payment = list()
        sql = """select p.Payment , CONCAT(u.FirstName,' ' ,u.LastName), CONCAT(s.FirstName,' ' ,s.LastName), p.Payoff , p.Date
        from payments p , users u , students s
        where p.Id_User = u.Id and p.Id_Student = s.Id ;"""
        data = self.con.Select_Data_More_Row(sql)
        for items in data:
            selected = dict()
            selected['Payment'] = items[0]
            selected['FullName'] = items[1]
            # selected['LastName'] = items[2]
            selected['FullName'] = items[2]
            # selected['LastName'] = items[4]
            selected['Payoff'] = items[3]
            selected['Date'] = items[4]
            payment.append(selected)
        return payment

    def get_all_cities(self):
        sql = """select Id , Name from City ; """
        data = self.con.Select_Data_More_Row(sql)
        return data


    def get_offer_by_produts(self) : 
        sql = '''SELECT o.Id_Items , i.Name ,i.Description , i.Image , i.price , o.New_Price , o.End_Date 
                FROM offers as o , items as i 
                WHERE o.Id_Items = i.Id and o.Type = 1   ; '''
                
        offers = self.con.Select_Data_More_Row(sql)
        Products = list()
        for offer in offers:
            data = dict()
            data ['Id'] = offer[0]
            data ['Name'] = offer[1]
            data ['Description'] = offer[2]
            data ['Image'] = offer[3]
            data ['Old_Price'] = offer[4]
            data ['New_Price'] = offer[5]
            data ['End_Date'] = offer[6]
            Products.append(data)
        return Products
        
    
    
    def get_offer_by_courses (self) : 
        sql = '''SELECT o.Id_Items , c.Name ,c.Description , c.Image , c.Price , o.New_Price , o.End_Date
                , c.Number_of_hours , c.Views 
                FROM offers as o , courses as c 
                WHERE o.Id_Items = c.Id and o.Type = 2   ;  '''
                
        offers = self.con.Select_Data_More_Row(sql)
        Products = list()
        for offer in offers:
            data = dict()
            data ['Id'] = offer[0]
            data ['Name'] = offer[1]
            data ['Description'] = offer[2]
            data ['Image'] = offer[3]
            data ['Old_Price'] = offer[4]
            data ['New_Price'] = offer[5]
            data ['End_Date'] = offer[6]
            data ['Number_of_hours'] = offer[7]
            data ['Views'] = offer[8]
            Products.append(data)
        return Products
    
    
    
class insert_data():
    def __init__(self):
        self.con = db.DataBase()

    def check_Student_exists(self, column: str, value) -> bool:
        sql = """SELECT count(*) FROM students WHERE {} ='{}' ;""".format(column, value)
        data = self.con.Select_Data_One_Row(sql)
        if data[0] == 0:
            return False
        else:
            return True

    def add_student(self, **info) -> bool:
        try:
            if self.check_Student_exists('Email', info['Email']) == True:
                return False, 'An email already exists Please enter a new email'

            Email_Pattern = "[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
            if re.search(Email_Pattern, info['Email']) == True:
                return False, 'The correct email entry is entered'

            if self.check_Student_exists('Phone', info['Phone']) == True:
                return False, 'Phone number already exists. Please enter a new number'

            if info['Phone'][0:3] not in ['079', '078', '077']:
                return False, 'Phone number is not from the telecommunications service providers in Jordan (Zain, Umniah, Orange).'

            self.con.Insert_Data('students', **info)
            return True

        except:
            return False, 'A system error occurred, please try again later'

    def add_course(self, **info) -> bool:
        try:
            self.con.Insert_Data('courses', **info)
            return True
        except:
            return False, 'A system error occurred, please try again later'

    def add_class(self, **info) -> bool:
        try:
            self.con.Insert_Data(table='classes', **info)
            return True
        except:
            return False, 'A system error occurred, please try again later'

    def add_student_to_class(self, **info) -> bool:
        try:
            self.con.Insert_Data(table='stu_class', **info)
            return True
        except:
            return False, 'A system error occurred, please try again later'

    # test
    def add_category(self, **info) -> bool:
        try:
            self.con.Insert_Data(table='categories', **info)
            return True
        except:
            return False, 'A system error occurred, please try again later'

    # test
    def add_items(self, **info) -> bool:
        try:
            self.con.Insert_Data(table='categories', **info)
            return True
        except:
            return False, 'A system error occurred, please try again later'

    def Update_info_Student(self, **info) -> bool:

        if self.check_Student_exists('Email', info['Email']) == False:
            return False, 'An email already exists Please enter a new email'

        Email_Pattern = "[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
        if re.search(Email_Pattern, info['Email']) == True:
            return False, 'The correct email entry is entered'

        if self.check_Student_exists('Phone', info['Phone']) == True:
            return False, 'Phone number already exists. Please enter a new number'

        if info['Phone'][:3] not in ['079', '078', '077']:
            return False, 'Phone number is not from the telecommunications service providers in Jordan (Zain, Umniah, Orange).'
        Id = info['Id']
        del info['Id']
        print(info)
        self.con.Update_Data_All_Coulmn_String('students', Id, **info)
        return True

    # test
    def Update_info_course(self, **info) -> bool:
        try:
            # self.con.Update_Data_All_Coulmn_String('courses',info['Id'] , **info)
            return True
        except:
            return False, 'A system error occurred, please try again later'

        # test

    def Update_info_classes(self, **info) -> bool:
        try:
            # self.con.Update_Data_All_Coulmn_String('classes',info['Id'] , **info)
            return True
        except:
            return False, 'A system error occurred, please try again later'

    # test
    def Update_info_category(self, **info) -> bool:
        try:
            id = info['Id']
            del info['Id']
            self.con.Update_Data_All_Coulmn_String('categories', id , **info)
            return True
        except:
            return False, 'A system error occurred, please try again later'

    def Update_info_item(self, **info) -> bool:
        try:
            id = info['Id']
            del info['Id']
            self.con.Update_Data_All_Coulmn_String('items', id , **info)
            return True
        except:
            return False, 'A system error occurred, please try again later'


class delete_data():

    def __init__(self):
        self.con = db.DataBase()

    def check_student_exists(self, column, value):
        sql = """SELECT count(*) FROM students WHERE {} ='{}' ;""".format(column, value)
        data = self.con.Select_Data_One_Row(sql)
        print(data)
        if data[0] == 0:
            return False
        else:
            return True

    def delete_Student_by_Id(self, Id_Student: int) -> bool:
        try:
            if self.check_student_exists('Id', Id_Student) == False:
                return False, 'Student record not found'

            self.con.Delete_Data('students', 'Id', Id_Student)
            return True
        except:
            return False, 'Something went wrong please try again later'

    def delete_course_by_Id(self, Id_course: int) -> bool:
        try:
            self.con.Delete_Data('courses', 'Id', Id_course)
            return True
        except:
            return False, 'Something went wrong please try again later'

    def delete_classes_by_Id(self, Id_classes: int) -> bool:
        try:
            self.con.Delete_Data('classes', 'Id', Id_classes)
            return True
        except:
            return False, 'Something went wrong please try again later'

    # test
    def delete_items_by_Id(self, Id_items: int) -> bool:
        try:
            self.con.Delete_Data('items', 'Id', Id_items)
            return True
        except:
            return False, 'Something went wrong please try again later'

     # test
    def delete_category_by_Id(self, Id_category: int) -> bool:
        try:
            self.con.Delete_Data('categories', 'Id', Id_category)
            return True
        except:
            return False, 'Something went wrong please try again later'


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

    def Register_func(self, **info):
        """
        This function adds information to the database
        that the user entered in the fields in the (Sinup) interface :
        ( First Name , Last Name , Username , Email , Phone , Password ,Birthday,
          Gender  Country  )

        Initially it checks whether the entry is correct or incorrect and
        returns an error message in this case

        After , data is sent to the database to make sure the entered data
        is not duplicate

        If correct returns a message that the operation completed
        successfully and if there is an error returns an error message with
        the duplicate data specified
        """

        Email_Pattern = "[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
        if re.search(Email_Pattern, info['Email']) == True:
            return False, 'please enter a working email address'

        if self.check_user_exists('Email', info['Email']) == True:
            return False, 'An email already exists Please enter a new email'


        if self.check_user_exists('Phone', info['Phone']) == True:
            return False, 'Phone number already exists. Please enter a new number'

        info['Password'] = self.hash_password(info['Password'])

        self.con.Insert_Data(**info , table='users' )
        sql = "SELECT Id FROM users WHERE Email='{}' ; ".format(info['Email'])
        Id_User = self.con.Select_Data_One_Row(sql)
        return True, Id_User

    #        try :
    #        except :
    #            return False , 'System error occurred, please try again later'

    def Login_func(self, Email, password) -> int:
        """
        This function makes sure that the logon information is correct
        """
        sql = "SELECT Id ,Email , Password  FROM users WHERE Email='{}'  ; ".format(Email.lower())
        data = self.con.Select_Data_One_Row(sql)
        if len(data) == 0:
            return False, 'Email does not exist'
        try:
            if self.verify_password(data[2], password):
                return True, data[0]
            else:
                return False, 'Please enter a valid password'
        except:
            return False, 'Please enter a valid password'


show = Show_Data()
data = show.get_offer_by_produts()
