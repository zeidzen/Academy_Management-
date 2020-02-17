# -*- coding: utf-8 -*-
import config as con
from flask import Flask, request, url_for, redirect, session, jsonify, flash
from flask import render_template
import pages
import os
from werkzeug.utils import secure_filename
import processes_DB
import time

app = Flask(__name__)
# for session
app.secret_key = 'YYYY@#$%'


@app.route('/')
def index():
    return redirect(url_for('Home_Page'))


@app.route('/home')
def Home_Page():
    Home_Class = pages.Home()
    return render_template('home.html', data=Home_Class.data)


# ----------------------------------------------------------------


@app.route('/category=<Id_Category>/page=<page>')
def Category_Page(Id_Category: int, page=1, sort=0):
    Category_Class = pages.Category(int(Id_Category), page=int(page)
                                    , sort=int(sort))
    if Category_Class.data['Max_Page'] < int(page):
        Category_Class.data['page'] = 1
    return render_template('products_by_Category.html', data=Category_Class.data)


@app.route('/category=<Id_Category>/sort=<Sort>_maxnumber=<MaxNumber>_page=<page>')
def Sort_Product_By_Category(Id_Category: int, Sort: str, MaxNumber: int, page):
    Category_Class = pages.Category(int(Id_Category), int(page), int(Sort), int(MaxNumber))
    return render_template('products.html', data=Category_Class.data)


# ----------------------------------------------------------------


@app.route('/products/page=<page>')
def products_Page(page=1, sort=0):
    Products_Class = pages.Products(int(page), int(sort))
    if Products_Class.data['Max_Page'] < int(page):
        Products_Class.data['page'] = 1
    return render_template('products.html', data=Products_Class.data)


@app.route('/products/sort=<Sort>_maxnumber=<MaxNumber>_page=<page>')
def Method_Show_Product(Sort: str, MaxNumber: int, page):
    Products_Class = pages.Products(int(page), int(Sort), int(MaxNumber))
    return render_template('products.html', data=Products_Class.data)


@app.route('/product/<Id_product>')
def product_Page(Id_product):
    Product_Class = pages.Product(int(Id_product))
    return render_template('product-detail.html', data=Product_Class.data)


# ----------------------------------------------------------------

@app.route('/courses/page=<page>')
def Courses_Page(page):
    Courses_Class = pages.Courses(page)
    return render_template('courses.html', data=Courses_Class.data)


@app.route('/course/<Id_Course>')
def Course_Page(Id_Course):
    Course_Class = pages.Course(int(Id_Course))
    return render_template('courses-detail.html', data=Course_Class.data)


# ----------------------------------------------------------------


@app.route('/achievements/page=<page>')
def Achievements_Page(page):
    Achievements_Class = pages.Achievements(page)
    return render_template('posts.html', data=Achievements_Class.data)


@app.route('/post/<Id_post>')
def Post_Page(Id_post):
    Post_Class = pages.Post(int(Id_post))
    return render_template('post-detail.html', data=Post_Class.data)


# ----------------------------------------------------------------


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


@app.route('/faqs')
def Faqs_Page():
    FAQ_Class = pages.FAQ()
    return render_template('faqs.html', data=FAQ_Class.data)


# ==============================================================================
# ==============================================================================
# ==============================================================================
# Dashboard
@app.route('/TTADP')
def Dashboard_Page():
    return render_template('/Dashboard/login.html')


# -----------------------------------------------------------------------------


@app.route('/login')
def Login_Page():
    Login_Class = pages.Login()
    if 'Login_Error' in session:
        Login_Class.data['Login_Error'] = session['Login_Error']
        del session['Login_Error']
    return render_template('/DashBoard/DashBoard_index.html', data=Login_Class.data)


@app.route('/login_check', methods=['POST'])
def check_Login_Page():
    data = dict()
    Login_Class = pages.Login()
    if request.method == 'POST':
        data['Password'] = request.form['pass']
        data['Email'] = request.form['email']

        # Cheak User Information
        status = Login_Class.get_login(**data)
        if status[0] == True:
            session['Id_User'] = status[1]
            return redirect(url_for('Home_Page'))
        elif status[0] == False:
            session['Login_Error'] = status[1]
            return redirect(url_for('Login_Page'))
    else:
        return redirect(url_for('Login_Page'))


# ----------------------------------------------------------------

@app.route('/sinup')
def Sinup_Page():
    Sinup_Class = pages.Signup()
    if 'Sinup_Error' in session:
        Sinup_Class.data['Sinup_Error'] = session['Sinup_Error']
        del session['Sinup_Error']
    return render_template('register.html', data=Sinup_Class.data)


@app.route('/register', methods=['POST'])
def register_data():
    data = dict()
    Sinup_Class = pages.Signup()
    UPLOAD_FOLDER = 'static/img/user_image'
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
        app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
        image = request.files['Image']
        if image and Sinup_Class.Check_Image_Extenstion(image.filename):
            filename = secure_filename(image.filename)
            image.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        data['image'] = '../' + UPLOAD_FOLDER + image.filename

        # Insert Data
        status = Sinup_Class.Regiter(**data)
        if status[0] == True:
            session['Id_User'] = status[1]
            return redirect(url_for('Home_Page'))

        elif status[0] == False:
            session['Sinup_Error'] = status[1]
            return redirect(url_for('Sinup_Page'))

# ----------------------------------------------------------------------------


# -------------------------------------------------------------------------
@app.route('/add_courses')
def Add_Courses_Page():
    courses_Class = pages.Courses()
    return render_template('/DashBoard/add_courses.html', data=courses_Class.data)


@app.route('/Add_courses_to_DB', methods=['POST'])
def Add_Courses():
    data = dict()
    courses_Class = pages.Courses()
    if request.method == 'POST':
        data['Id'] = 0
        data['Id_category'] = request.form['category_Id']
        data['Name'] = request.form['courses_name']
        data['Brief'] = request.form['courses_brief']
        data['Description'] = request.form['courses_description']

        UPLOAD_FOLDER = 'static/img/course_image'
        app = Flask(__name__)
        app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

        image = request.files['courses_image']
        # if user does not select file, browser also
        # submit a empty part without filename

        if image and courses_Class.Check_Image_Extenstion(image.filename):
            filename = secure_filename(image.filename)
            image.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))

        data['Image'] = '../'+UPLOAD_FOLDER + image.filename
        data['Price'] = request.form['courses_price']
        data['Number_of_hours'] = request.form['courses_num_of_hours']
        data['Views'] = request.form['courses_view']

        courses_Class.add_courses(**data)
        return render_template('/DashBoard/add_courses.html', data=courses_Class.data)
    else:
        return redirect(url_for('Add_Courses_Page'))


# ----------------------------------------------------------------------------
@app.route('/Add_category')
def add_category_Page():
    Add_Class = pages.Add_Category()
    return render_template('/DashBoard/add_category.html', data=Add_Class.data)


@app.route('/Add_category_to_DB', methods=['POST'])
def add_Category():
    data = dict()
    Add_Class = pages.Add_Category()
    if request.method == 'POST':
        data['ID'] = 0
        data['Name'] = request.form['category_name']
        data['Type'] = request.form['category_type']
        Add_Class.Add_category(**data)

        return render_template('/DashBoard/add_category.html', data=Add_Class.data)
    else:
        return redirect(url_for('add_category_Page'))


# ----------------------------------------------------------------------------
@app.route('/Add_items')
def add_item_Page():
    Add_Class = pages.Add_Item()
    return render_template('/DashBoard/add_items.html', data=Add_Class.data)


@app.route('/Add_items_to_DB', methods=['POST'])
def add_Items():
    data = dict()
    Add_Class = pages.Add_Item()
    if request.method == 'POST':

        data['ID'] = 0
        data['Id_category'] = request.form['category_Id']
        data['Name'] = request.form['item_name']
        data['Brief'] = request.form['item_brief']
        data['Description'] = request.form['item_description']
        data['Price'] = request.form['item_price']
        UPLOAD_FOLDER = 'static/img/item_image'
        reg_class = pages.Add_Item()
        app = Flask(__name__)
        app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
        # check if the post request has the file part
        # if 'file' not in request.files:
        #     flash('No file part')
        #     return redirect('Add_items.html')
        image = request.files['item_image']
        # if user does not select file, browser also
        # submit a empty part without filename
        if image.filename == '':
            flash('No selected file')
            return redirect(url_for('add_item_Page'))
        if image and Add_Class.Check_Image_Extenstion(image.filename):
            filename = secure_filename(image.filename)
            image.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))

        data['Image'] = '../'+UPLOAD_FOLDER + image.filename
        data['Views'] = request.form['item_view']
        data['Availability'] = request.form['item_availability']
        Add_Class.Add_items(**data)

        return render_template('/DashBoard/add_items.html', data=Add_Class.data)
    else:
        return redirect(url_for('add_item_Page'))


# ----------------------------------------------------------------------------

@app.route('/Add_student')
def add_student_Page():
    Add_Student = pages.Add_Student()
    return render_template('/DashBoard/add_student.html', data=Add_Student.data)


@app.route('/Add_student_to_DB', methods=['POST'])
def add_Student():
    data = dict()
    Add_Student = pages.Add_Student()
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

        Add_Student.Add_students(**data)

        return render_template('/DashBoard/add_student.html', data=Add_Student.data)
    else:
        return redirect(url_for('add_student_Page'))


# ----------------------------------------------------------------------------

@app.route('/Add_classes')
def add_class_Page():
    Add_Classes = pages.Add_Classes()
    return render_template('/DashBoard/add_classes.html', data=Add_Classes.data)


@app.route('/Add_class_to_DB', methods=['POST'])
def add_Class():
    data = dict()
    Add_Classes = pages.Add_Classes()
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

        Add_Classes.Add_class(**data)

        return render_template('/DashBoard/add_classes.html', data=Add_Classes.data)
    else:
        return redirect(url_for('add_class_Page'))


# ----------------------------------------------------------------------------
@app.route('/Add_Student_Class')
def add_Student_Class_Page():
    Add_Stu_Classes = pages.Add_Student_Class()
    return render_template('/DashBoard/add_stu_class.html', data=Add_Stu_Classes.data)


@app.route('/Add_student_class_to_DB', methods=['POST'])
def add_student_class():
    data = dict()
    Add_Stu_Classes = pages.Add_Student_Class()
    if request.method == 'POST':

        data['Id'] = 0
        data['Id_Student'] = request.form['student_id']
        data['Id_Class'] = request.form['class_id']


        Add_Stu_Classes.Add_stu_class(**data)

        return render_template('/DashBoard/add_stu_class.html', data=Add_Stu_Classes.data)
    else:
        return redirect(url_for('add_Student_Class_Page'))


# ----------------------------------------------------------------------------
# ==============================================================================
# ==============================================================================

@app.route('/ForgottenPassword')
def ForgottenPassword_Page():
    pass


@app.errorhandler(404)
def page_not_found(error):
    Error404_class = pages.Error_page()
    return render_template('404.html', data=Error404_class.data)


if __name__ == '__main__':
    app.run(debug=con.debug, port=con.port, host=con.host)