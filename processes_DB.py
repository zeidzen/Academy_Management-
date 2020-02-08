
import database as db
import hashlib, binascii
import re
import os
# -*- coding: utf-8 -*-


class Show_All_Data():
    def __init__(self):
        self.con = db.DataBase()

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
        sql = """select Name, Description, Price, Date  from items where Name = {];""".format(name)
        data = self.con.Select_Data_More_Row(sql)
        for items in data:
            selected = dict()
            selected['Name'] = items[0]
            selected['Description'] = items[1]
            selected['Price'] = items[2]
            selected['Date'] = items[3]
            item.append(selected)
        return item

    def get_items_categories(self) -> list:
        category = list()
        sql = """select Name  from Categories where Type = 1;"""
        data = self.con.Select_Data_More_Row(sql)
        for cat in data:
            select = dict()
            select['Name'] = cat[0]
            category.append(select)
        return category

    def get_all_courses(self) -> list:
        courses = list()
        sql = """select Name, Description, Image, Price, Num_of_hours, Date  from Courses;"""
        data = self.con.Select_Data_More_Row(sql)
        for items in data:
            selected = dict()
            selected['Name'] = items[0]
            selected['Description'] = items[1]
            selected['Image'] = items[2]
            selected['Price'] = items[3]
            selected['Num_of_hours'] = items[4]
            selected['Date'] = items[5]
            courses.append(selected)
        return courses

    def search_course(self, name: str) -> list:
        courses = list()
        sql = """select Name, Description, Image, Price, Num_of_hours, Date  from Courses where Name = {];""".format(
            name)
        data = self.con.Select_Data_More_Row(sql)
        for items in data:
            selected = dict()
            selected['Name'] = items[0]
            selected['Description'] = items[1]
            selected['Image'] = items[2]
            selected['Price'] = items[3]
            selected['Num_of_hours'] = items[4]
            selected['Date'] = items[5]
            courses.append(selected)
        return courses

    def get_courses_categories(self) -> list:
        category = list()
        sql = """select Name  from Categories where Type = 2 ;"""
        data = self.con.Select_Data_More_Row(sql)
        for cat in data:
            select = dict()
            select['Name'] = cat[0]
            category.append(select)
        return category

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


show = Show_All_Data()

print(show.get_all_items())