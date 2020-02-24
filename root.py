#$# -*- coding: utf-8 -*-
import config as con
from flask import Flask, request, url_for, redirect, session, jsonify, flash
from flask import render_template
import pages
import os
from werkzeug.utils import secure_filename
import time

app = Flask(__name__)
# for session
app.secret_key = 'Ýy:þCr0qIPüÈø~~E-^pP>·ê¨ç¥MB|aXÁ'


@app.route('/')
def index():
    return redirect(url_for('Home_Page'))


@app.route('/home')
def Home_Page():
    Home_Class = pages.Home()
    return render_template('home.html', data=Home_Class.data)


# ----------------------------------------------------------------

@app.route('/category_products=<Id_Category>/page=<page>')
def category_products(Id_Category: int, page=1, sort=0):
    Products_Class = pages.Products()
    Products_Class.Show_Category_Products(int(Id_Category), page=int(page)
                                             , sort=int(sort))
    if Products_Class.data['Max_Page'] < int(page):
        Products_Class.data['page'] = 1
    return render_template('products_by_Category.html', data=Products_Class.data)


@app.route('/category_products=<Id_Category>/sort=<Sort>_maxnumber=<MaxNumber>_page=<page>')
def Sort_Product_By_Category(Id_Category: int, Sort: str, MaxNumber: int, page):
    Products_Class = pages.Products()
    Products_Class.Show_Category_Products (int(Id_Category), int(page), int(Sort), int(MaxNumber))
    return render_template('products.html', data=Products_Class.data)


@app.route('/category_courses=<Id_Category>/page=<page>')
def Category_Courses_Page(Id_Category, page):
    Courses_Class = pages.Courses()
    Courses_Class.Show_Courses_Category (Id_Category, page)
    return render_template('courses_by_Category.html', data=Courses_Class.data)

@app.route('/add_category')
def add_category_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))
    Courses_Class = pages.Courses()
    Courses_Class.Show_Data_User(session['Id_User'])
    return render_template('DB_Add_Category.html', data=Courses_Class.data)


@app.route('/add_category_to_db', methods=['POST'])
def add_Category():
    data = dict()
    if request.method == 'POST':
        data['Name'] = request.form['category_name']
        data['Type'] = request.form['category_type']
        Courses_Class = pages.Courses()
        Courses_Class.Add_category(**data)
    return redirect(url_for('add_category_Page'))


#==============================================================================
#==============================================================================
@app.route('/products/page=<page>')
def products_Page(page=1, sort=0):
    Products_Class = pages.Products()
    Products_Class.Show_Data_Products (int(page), int(sort))
    Products_Class.data ['title'] = 'Products'
    if Products_Class.data['Max_Page'] < int(page) :
        Products_Class.data['page'] = 1
    return render_template('products.html', data=Products_Class.data)


@app.route('/products/sort=<Sort>_maxnumber=<MaxNumber>_page=<page>')
def Method_Show_Product(Sort: str, MaxNumber: int, page):
    Products_Class = pages.Products()
    Products_Class.Show_Data_Products (int(page), int(Sort), int(MaxNumber))
    return render_template('products.html', data=Products_Class.data)


@app.route('/product/<Id_product>')
def product_Page(Id_product):
    Products_Class = pages.Products()
    Products_Class.show_details_Product (int(Id_product))
    return render_template('product-detail.html', data=Products_Class.data)


@app.route('/add_product')
def add_product_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Products_Class =pages.Products ()
    Products_Class.Show_Data_User(session ['Id_User'])
    Products_Class.data ['title'] = 'Add Product'
    return render_template('DB_Add_Items.html', data=Products_Class.data)


@app.route('/add_product_to_db', methods=['POST'])
def Add_Product():
    
    Products_Class =pages.Products ()
    data = dict()
    if request.method == 'POST':
        data['Id_Category'] = request.form['category_Id']
        data['Name'] = request.form['item_name']
        data['Brief'] = request.form['item_brief']
        data['Description'] = request.form['item_description']
        data['Price'] = request.form['item_price']
        image = request.files['item_image']
        data['Image'] = Products_Class.Uploud_Image('static/img/product_image/', image)
        data['Views'] = request.form['item_view']
        data['Availability'] = request.form['item_availability']
        status = Products_Class.Add_Product(**data)

        if status[0] == True:
            return redirect(url_for('add_item_Page'))

        elif status[0] == False:
            session['Add_Product_Error'] = status[1]
            return redirect(url_for('add_item_Page'))

    return redirect(url_for('add_item_Page'))

@app.route('/display_product')
def Display_Products_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))
    Products_Class = pages.Products ()
    Products_Class.data['title'] = 'Display Product'
    Products_Class.Show_Data_User ( session ['Id_User'] )
    return render_template('DB_Item_Table.html', data=Products_Class.data)

#==============================================================================
#==============================================================================
    
@app.route('/courses/page=<page>')
def Courses_Page(page):
    Courses_Class = pages.Courses()
    Courses_Class.Show_Data_Courses(page)
    return render_template('courses.html', data=Courses_Class.data)


@app.route('/course/<Id_Course>')
def Course_Page(Id_Course):
    Courses_Class = pages.Courses()
    Courses_Class.Show_Details_Course (int(Id_Course))
    return render_template('courses-detail.html', data=Courses_Class.data)



@app.route('/add_courses')
def Add_Courses_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))
    Courses_Class = pages.Courses()
    Courses_Class.data ['title'] = 'Add Courses'
    Courses_Class.Show_Data_User(session['Id_User'])
    return render_template('DB_Add_Courses.html', data=Courses_Class.data)


@app.route('/Add_courses_to_DB', methods=['POST'])
def Add_Courses():
    Courses_Class = pages.Courses()
    if request.method == 'POST':
        data = dict()
        data['Id_category'] = request.form['category_Id']
        data['Name'] = request.form['courses_name']
        data['Brief'] = request.form['courses_brief']
        data['Description'] = request.form['courses_description']
        image = request.files['courses_image']
        data['Image'] = Courses_Class.Uploud_Image('static/img/course_image/', image)
        data['Price'] = request.form['courses_price']
        data['Number_of_hours'] = request.form['courses_num_of_hours']
        data['Views'] = request.form['courses_view']
        Courses_Class.add_courses(**data)
        return redirect(url_for('Add_Courses_Page'))
    else:
        return redirect(url_for('Add_Courses_Page'))




#==============================================================================
#==============================================================================
        
@app.route('/achievements/page=<page>')
def Achievements_Page(page):
    Achievements_Class = pages.Achievements () 
    Achievements_Class.Show_Data_Achievements(page)
    return render_template('Achievements.html', data=Achievements_Class.data)

@app.route('/posts/page=<page>')
def Posts_Page(page):
    Achievements_Class = pages.Achievements () 
    Achievements_Class.Show_Data_Posts(page)
    return render_template('posts.html', data=Achievements_Class.data)

@app.route('/post/<Id_post>')
def Post_Page(Id_post):
    Achievements_Class = pages.Achievements () 
    Achievements_Class.Show_Details_Achievement(int(Id_post))
    return render_template('post-detail.html', data=Achievements_Class.data)



@app.route('/add_post')
def add_Achievements_Class_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Achievements_Class = pages.Achievements()
    Achievements_Class.data ['title'] = 'Add Achievements'
    Achievements_Class.Show_Data_User (session ['Id_User'])
    return render_template('DB_Add_Post.html', data=Achievements_Class.data)


@app.route('/add_post_to_db', methods=['POST'])
def add_Post():
    data = dict()
    Achievements_Class = pages.Achievements()
    if request.method == 'POST':
        data['Id_User'] = session['Id_User']
        data['Title'] = request.form['post_title']
        data['Brief'] = request.form['post_brief']
        data['Content'] = request.form['post_content']
        Media = request.files['post_media']
        data['Media'] = Achievements_Class.Uploud_Image('static/img/post_image/', Media)
        data['Type'] = request.form['post_type']
        Achievements_Class.Add_Achievement(**data)
        
        
    return redirect(url_for('add_Achievements_Class_Page'))


#==============================================================================
#==============================================================================
    
@app.route('/search', methods=['POST'])
def Search():
    if request.method == 'POST':
        Search = request.form['search']
        return redirect(url_for('Search_Page', search=str(Search), page=1))
    else:
        return redirect(url_for('Home_Page'))


@app.route('/search=<search>/page=<page>')
def Search_Page(search, page=1):
    Search_Class = pages.Search(search, int(page))
    return render_template('search.html', data=Search_Class.data)


# -----------------------------------------------------------------------------

@app.route('/about')
def About_Page():
    About_Class = pages.About()
    return render_template('about.html', data=About_Class.data)



# ==============================================================================
# ==============================================================================

# Dashboard
@app.route('/TTADB')
def Dashboard_Page():
    if 'Id_User' in session:
        Id_User = session['Id_User']
        Dashboard_Class = pages.Dashboard(Id_User)
        return render_template('/DashBoard.html', data=Dashboard_Class.data)
    else:
        return redirect(url_for('Home_Page'))


# -----------------------------------------------------------------------------
# @app.route('/my_account')
# def Account_Page():
#     if 'Id_User' in session:
#         Id_User = session['Id_User']
#         Account_Class = pages.Users(Id_User)
#         return render_template('DP_My_Account.html', data=Account_Class.data)
#     else:
#         return redirect(url_for('Home_Page'))


# -----------------------------------------------------------------------------

@app.route('/login')
def Login_Page():
    if 'Id_User' in session:
        return redirect(url_for('Dashboard_Page'))
    else:
        
        Users_Class = pages.Users()
        if 'Login_Error' in session:
            Users_Class.data['Login_Error'] = session['Login_Error']
            del session['Login_Error']
        return render_template('DB_Login.html', data=Users_Class.data)


@app.route('/logout')
def Logout_Page():
    if 'Id_User' in session:
        del session['Id_User']
        return redirect(url_for('Home_Page'))
    else:
        return redirect(url_for('Home_Page'))


@app.route('/login_check', methods=['POST'])
def check_Login_Page():
    data = dict()
    Users_Class = pages.Users()
    if request.method == 'POST':
        data['Password'] = request.form['pass']
        data['Email'] = request.form['email']

        # Cheak User Information
        status = Users_Class.login(**data)
        if status[0] == True:
            session['Id_User'] = status[1]
            return redirect(url_for('Login_Page'))
        elif status[0] == False:
            session['Login_Error'] = status[1]
            return redirect(url_for('Login_Page'))
    else:
        return redirect(url_for('Login_Page'))

@app.route('/add_user')
def Sinup_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))
    Users_Class = pages.Users()
    if 'Sinup_Error' in session:
        Users_Class.data['Sinup_Error'] = session['Sinup_Error']
        del session['Sinup_Error']
    Users_Class.Show_Data_User (session ['Id_User'])
    return render_template('DB_Register.html', data=Users_Class.data)


@app.route('/register', methods=['POST'])
def register_data():
    data = dict()
    Users_Class = pages.Users()
    if request.method == 'POST':
        data['FirstName'] = request.form['firstname']
        data['LastName'] = request.form['lastname']
        data['Email'] = request.form['email']
        data['Phone'] = request.form['telephone']
        data['Password'] = request.form['password']
        data['Gender'] = request.form['newsletter']
        data['Id_Address'] = request.form['country_id']
        # birthday
        birthday = request.form['birthday']
        data['birthday'] = birthday.replace('/', '-')
        # Image
        image = request.files['user_image']
        data['Image'] = Add_Product.Uploud_Image('static/img/user_image/', image)

        # Insert Data
        status = Users_Class.Add_User(**data)
        if status[0] == True:
            session['Id_User'] = status[1]
            return redirect(url_for('Home_Page'))

        elif status[0] == False:
            session['Sinup_Error'] = status[1]
            return redirect(url_for('Sinup_Page'))

#==============================================================================
#==============================================================================
            
@app.route('/add_student')
def add_student_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))
    Students_Class =pages.Students()
    Students_Class.data ['title'] = 'Add Student'
    Students_Class.Show_Data_User (session ['Id_User'])
    return render_template('DB_Add_Student.html', data=Students_Class.data)

@app.route('/add_student_to_db', methods=['POST'])
def add_Student():
    data = dict()
    Students_Class =pages.Students()
    if request.method == 'POST':
        data['Id'] = 0
        data['FirstName'] = request.form['firstname']
        data['LastName'] = request.form['lastname']
        data['Gender'] = request.form['newsletter']
        data['Phone'] = request.form['telephone']
        data['Email'] = request.form['email']
        data['Birthday'] = request.form['birthday']
        data['Birthday'] = data['Birthday'].replace('/', '-')
        data['Id_Address'] = request.form['country_id']
        data['Id_University'] = request.form['university_id']
        data['Id_Specialization'] = request.form['specialization_id']
        Students_Class.Add_students(**data)
        return redirect(url_for('add_student_Page'))
    else:
        return redirect(url_for('add_student_Page'))

@app.route('/add_student_class')
def add_Student_Class_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Classes_Class = pages.Classes()
    Classes_Class.data ['title'] = 'Add Student To Class'
    Classes_Class.Show_Data_User(session ['Id_User'])
    return render_template('DB_Add_Stu_Class.html', data=Classes_Class.data)


@app.route('/add_student_class_to_db', methods=['POST'])
def add_student_class():
    data = dict()
    Classes_Class = pages.Classes()
    if request.method == 'POST':
        data['Id'] = 0
        data['Id_Student'] = request.form['student_id']
        data['Id_Class'] = request.form['class_id']

        Classes_Class.Add_stu_class(**data)

    return redirect(url_for('add_Student_Class_Page'))



@app.route('/display_student')
def Display_Student_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Student_Class = pages.Students()
    Student_Class.Show_Data_Students()
    Student_Class.Show_Data_User ( session ['Id_User']) 
    return render_template('DB_Student_Table.html', data=Student_Class.data)

#==============================================================================
#==============================================================================
    
@app.route('/add_classes')
def add_class_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Classes_Class = pages.Classes()
    Classes_Class.data ['title'] = 'Add Class'
    Classes_Class.Show_Data_User(session ['Id_User'])
    return render_template('DB_Add_Classes.html', data=Classes_Class.data)


@app.route('/add_class_to_db', methods=['POST'])
def add_Class():
    data = dict()
    Classes_Class = pages.Classes()
    if request.method == 'POST':
        data['Id'] = 0
        data['Id_course'] = request.form['Course_id']
        data['Name'] = request.form['class_name']
        data['Start_Date'] = request.form['start_date']
        data['Start_Date'] = data['Start_Date'].replace('/', '-')
        data['End_Date'] = request.form['end_date']
        data['End_Date'] = data['End_Date'].replace('/', '-')
        data['Lecturer'] = request.form['lecturer_name']
        data['capacity'] = request.form['capacity']
        Classes_Class.Add_class(**data)
        return redirect(url_for('add_class_Page'))
    else:
        return redirect(url_for('add_class_Page'))
#==============================================================================
#==============================================================================

@app.route('/add_offer')
def add_offer_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))
    
    Offers_Class = pages.Offers ()
    Offers_Class.data ['title'] = 'Add Offers'
    Offers_Class.Show_Data_User (session ['Id_User'])
    return render_template('DB_Add_Offers.html', data=Offers_Class.data)


@app.route('/add_offers_to_db', methods=['POST'])
def add_Offers():
    data = dict()
    Offers_Class = pages.Classes ()
    if request.method == 'POST':
        data['Id_Item'] = request.form['Product_id']
        data['New_Price'] = request.form['new_price']
        data['End_Date'] = request.form['end_date']
        data['End_Date'] = data['End_Date'].replace('/', '-')
        data['Type'] = request.form['type']
        Offers_Class.Add_Offers(**data)

    return redirect(url_for('add_offer_Page'))


#==============================================================================
#==============================================================================
@app.route('/add_payment')
def add_payment_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Payments_Class = pages.Payments ()
    Payments_Class.data ['title'] = 'Add payment'
    Payments_Class.Show_Data_User(session ['Id_User'])
    return render_template('DB_Add_Payment.html', data=Payments_Class.data)


@app.route('/add_payments_to_db', methods=['POST'])
def add_Payment():
    data = dict()
    Payments_Class = pages.Payments ()
    if request.method == 'POST':
        data['Id_User'] = session['Id_User']
        data['Id_Student'] = request.form['Student_id']
        data['Payment'] = request.form['Payment']
        data['Payoff'] = request.form['Payoff']
        Payments_Class.Add_Payment(**data)
    return redirect(url_for('add_payment_Page'))

#==============================================================================
#==============================================================================
@app.route('/add_city_uni_spel')
def add_city_uni_spe_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    City_Uni_Spel_Class = pages.City_Uni_Spel()
    City_Uni_Spel_Class.Show_Data_User(session ['Id_User'])
    return render_template('DB_Add_City_Uni_Spel.html', data=City_Uni_Spel_Class.data)


@app.route('/add_city_to_db', methods=['POST'])
def add_city_uni_spe_func():
    data = dict()
    City_Uni_Spel_Class = pages.City_Uni_Spel()
    if request.method == 'POST':
        Type = request.form['Type' ]
        data['Name'] = request.form['Name' ]
        
        if Type == '1' : 
             City_Uni_Spel_Class.add_city(**data)
        elif Type == '2' : 
             City_Uni_Spel_Class.add_university (**data)
        elif Type == '3' : 
            City_Uni_Spel_Class.add_specializaton (**data)    
    City_Uni_Spel_Class.add_city(**data)
    return redirect(url_for('add_city_uni_spe_Page'))



# ----------------------------------------------------------------------------



# ----------------------------------------------------------------------------



# ----------------------------------------------------------------------------

@app.route('/display_class')
def Display_Class_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Classes_Class = pages.Classes ()
    Classes_Class.data['title'] = 'Display Classes'
    Classes_Class.Show_Data_Classes()
    return render_template('DB_Class_Table.html', data=Classes_Class.data)

# ----------------------------------------------------------------------------

@app.route('/display_course')
def Display_Course_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Courses_Class =pages.Courses ()
    Courses_Class.data ['title'] = 'Dispaly Courses'
    Courses_Class.Show_Data_Courses()
    return render_template('DB_Course_Table.html', data=Courses_Class.data)


# ----------------------------------------------------------------------------

@app.route('/display_Post')
def Display_Post_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))


    Achievements_Class = pages.Achievements()
    Achievements_Class.data ['title'] = 'Displat Achievements'
    Achievements_Class.Show_Data_Achievements()
    return render_template('DB_Post_Table.html', data=Achievements_Class.data)


# ----------------------------------------------------------------------------

@app.route('/display_payment')
def Display_Payment_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Payments_Class = pages.Payments()
    Payments_Class.data ['title'] = 'Display Payments'
    Payments_Class.Show_Data_Payments()
    return render_template('DB_Payment_Table.html', data=Payments_Class.data)


# ----------------------------------------------------------------------------

@app.route('/display_Offer')
def Display_Offer_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Offers_Class = pages.Offers ()
    Offers_Class.data ['title'] = 'Display Offers'
    Offers_Class.Show_Offers_Curses()
    Offers_Class.Show_Offers_Products()
    return render_template('DB_Offer_Table.html', data=Offers_Class.data)
# ----------------------------------------------------------------------------

@app.route('/display_user_info')
def Display_User_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Users_Class = pages.Users()
    Users_Class.Show_Data_User(session['Id_User'])
    Users_Class.data ['title'] = 'Display Users'
    return render_template('DB_User_Profile.html', data=Users_Class.data)
# ==============================================================================
# ==============================================================================
    


@app.route('/delete_student/<id_student>')
def Delete_Student_Page(id_student):
    Students_Class = pages.Students()
    Students_Class.Del_student(int(id_student))
    return redirect(url_for('Display_Student_Page'))


@app.route('/delete_product/<id_product>')
def Delete_Product_Page(id_product):
    Products_Class = pages.Products()
    Products_Class.Del_product(int(id_product))
    return redirect(url_for('Display_Item_Page'))


@app.route('/delete_course/<id_course>')
def Delete_Course_Page(id_course):
    Courses_Class = pages.Courses()
    Courses_Class.Del_course(int(id_course))
    return redirect(url_for('Display_Course_Page'))


@app.route('/delete_class/<id_class>')
def Delete_Class_Page(id_class):
    Classes_Class = pages.Classes()
    Classes_Class.Del_class(int(id_class))
    return redirect(url_for('Display_Class_Page'))

@app.route('/delete_category/<id_category>')
def Delete_Category_Page(id_category):
    Students_Class = pages.Students()
    Students_Class.Del_category(int(id_category))
    return redirect(url_for('Display_Category_Page'))




@app.route('/ForgottenPassword')
def ForgottenPassword_Page():
    pass


@app.errorhandler(404)
def page_not_found(error):
    Error404_class = pages.Error_page()
    return render_template('404.html', data=Error404_class.data)


if __name__ == '__main__':
    app.run(debug=con.debug, port=con.port, host=con.host_app)