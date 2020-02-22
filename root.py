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

@app.route('/category_products=<Id_Category>/page=<page>')
def category_products(Id_Category: int, page=1, sort=0):
    Category_Class = pages.Category_Products(int(Id_Category), page=int(page)
                                             , sort=int(sort))
    if Category_Class.data['Max_Page'] < int(page):
        Category_Class.data['page'] = 1
    return render_template('products_by_Category.html', data=Category_Class.data)


@app.route('/category_products=<Id_Category>/sort=<Sort>_maxnumber=<MaxNumber>_page=<page>')
def Sort_Product_By_Category(Id_Category: int, Sort: str, MaxNumber: int, page):
    Category_Class = pages.Category_Products(int(Id_Category), int(page), int(Sort), int(MaxNumber))
    return render_template('products.html', data=Category_Class.data)


@app.route('/category_courses=<Id_Category>/page=<page>')
def Category_Courses_Page(Id_Category, page):
    Courses_Class = pages.Courses_Category(Id_Category, page)
    return render_template('courses.html', data=Courses_Class.data)


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
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
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
@app.route('/my_account')
def Account_Page():
    if 'Id_User' in session:
        Id_User = session['Id_User']
        Account_Class = pages.Account(Id_User)
        return render_template('DP_My_Account.html', data=Account_Class.data)
    else:
        return redirect(url_for('Home_Page'))


# -----------------------------------------------------------------------------

@app.route('/login')
def Login_Page():
    if 'Id_User' in session:
        return redirect(url_for('Dashboard_Page'))
    else:
        Login_Class = pages.Login()
        if 'Login_Error' in session:
            Login_Class.data['Login_Error'] = session['Login_Error']
            del session['Login_Error']
        return render_template('DB_Login.html', data=Login_Class.data)


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
    Login_Class = pages.Login()
    if request.method == 'POST':
        data['Password'] = request.form['pass']
        data['Email'] = request.form['email']

        # Cheak User Information
        status = Login_Class.get_login(**data)
        if status[0] == True:
            session['Id_User'] = status[1]
            return redirect(url_for('Login_Page'))
        elif status[0] == False:
            session['Login_Error'] = status[1]
            return redirect(url_for('Login_Page'))
    else:
        return redirect(url_for('Login_Page'))


# ----------------------------------------------------------------

@app.route('/sinup')
def Sinup_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))
    Id_User = session['Id_User']

    Sinup_Class = pages.Signup(Id_User)
    if 'Sinup_Error' in session:
        Sinup_Class.data['Sinup_Error'] = session['Sinup_Error']
        del session['Sinup_Error']
    return render_template('DB_Register.html', data=Sinup_Class.data)


@app.route('/register', methods=['POST'])
def register_data():
    data = dict()
    Sinup_Class = pages.Signup(session['Id_User'])
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
        data['Image'] = Add_Product.Uploud_Image('static/img/product_image/', image)

        # Insert Data
        status = Sinup_Class.Regiter(**data)
        if status[0] == True:
            session['Id_User'] = status[1]
            return redirect(url_for('Home_Page'))

        elif status[0] == False:
            session['Sinup_Error'] = status[1]
            return redirect(url_for('Sinup_Page'))

        # ----------------------------------------------------------------------------


@app.route('/add_courses')
def Add_Courses_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))
    Id_User = session['Id_User']

    Courses_Class = pages.Add_Course(Id_User)
    return render_template('DB_Add_Courses.html', data=Courses_Class.data)


@app.route('/Add_courses_to_DB', methods=['POST'])
def Add_Courses():
    Courses_Class = pages.Add_Course(session['Id_User'])
    if request.method == 'POST':
        data = dict()
        feature_data = dict()
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


# ----------------------------------------------------------------------------
@app.route('/Add_category')
def add_category_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']

    Add_Class = pages.Add_Category(Id_User)
    return render_template('DB_Add_Category.html', data=Add_Class.data)


@app.route('/Add_category_to_DB', methods=['POST'])
def add_Category():
    data = dict()
    Add_Class = pages.Add_Category(session['Id_User'])
    if request.method == 'POST':
        data['Name'] = request.form['category_name']
        data['Type'] = request.form['category_type']
        Add_Class.Add_category(**data)

    return redirect(url_for('add_category_Page'))


# ----------------------------------------------------------------------------
@app.route('/Add_items')
def add_item_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))
    Id_User = session['Id_User']

    Add_Class = pages.Add_Item(Id_User)
    return render_template('DB_Add_Items.html', data=Add_Class.data)


@app.route('/Add_items_to_DB', methods=['POST'])
def Add_Product():
    data = dict()
    Add_Product = pages.Add_Item(session['Id_User'])
    if request.method == 'POST':
        data['Id_Category'] = request.form['category_Id']
        data['Name'] = request.form['item_name']
        data['Brief'] = request.form['item_brief']
        data['Description'] = request.form['item_description']
        data['Price'] = request.form['item_price']
        image = request.files['item_image']
        data['Image'] = Add_Product.Uploud_Image('static/img/product_image/', image)
        data['Views'] = request.form['item_view']
        data['Availability'] = request.form['item_availability']
        status = Add_Product.Add_items(**data)

        if status[0] == True:
            return redirect(url_for('add_item_Page'))

        elif status[0] == False:
            session['Add_Product_Error'] = status[1]
            return redirect(url_for('add_item_Page'))

    return redirect(url_for('add_item_Page'))


# ----------------------------------------------------------------------------

@app.route('/Add_student')
def add_student_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))
    Id_User = session['Id_User']

    Add_Student = pages.Add_Student(Id_User)
    return render_template('DB_Add_Student.html', data=Add_Student.data)


@app.route('/Add_student_to_DB', methods=['POST'])
def add_Student():
    data = dict()
    Add_Student = pages.Add_Student(session['Id_User'])
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
        return redirect(url_for('add_student_Page'))
    else:
        return redirect(url_for('add_student_Page'))


# ----------------------------------------------------------------------------

@app.route('/Add_classes')
def add_class_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))
    Id_User = session['Id_User']

    Add_Classes = pages.Add_Classes(Id_User)
    return render_template('DB_Add_Classes.html', data=Add_Classes.data)


@app.route('/Add_class_to_DB', methods=['POST'])
def add_Class():
    data = dict()
    Add_Classes = pages.Add_Classes(session['Id_User'])
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

        return redirect(url_for('add_class_Page'))
    else:
        return redirect(url_for('add_class_Page'))


# ----------------------------------------------------------------------------
@app.route('/Add_Student_Class')
def add_Student_Class_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))
    Id_User = session['Id_User']

    Add_Stu_Classes = pages.Add_Student_Class(Id_User)
    return render_template('DB_Add_Stu_Class.html', data=Add_Stu_Classes.data)


@app.route('/Add_student_class_to_DB', methods=['POST'])
def add_student_class():
    data = dict()
    Add_Stu_Classes = pages.Add_Student_Class(session['Id_User'])
    if request.method == 'POST':
        data['Id'] = 0
        data['Id_Student'] = request.form['student_id']
        data['Id_Class'] = request.form['class_id']

        Add_Stu_Classes.Add_stu_class(**data)

    return redirect(url_for('add_Student_Class_Page'))


# ----------------------------------------------------------------------------

@app.route('/Add_post')
def add_post_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']

    Add_Post = pages.Add_Post(Id_User)
    return render_template('DB_Add_Post.html', data=Add_Post.data)


@app.route('/Add_post_to_DB', methods=['POST'])
def add_Post():
    data = dict()
    Add_Post = pages.Add_Post(session['Id_User'])
    if request.method == 'POST':
        data['Id_User'] = session['Id_User']
        data['Title'] = request.form['post_title']
        data['Brief'] = request.form['post_brief']
        data['Content'] = request.form['post_content']
        Media = request.files['post_media']
        data['Media'] = Add_Post.Uploud_Image('static/img/post_image/', Media)
        Add_Post.add_posts(**data)

    return redirect(url_for('add_post_Page'))


# ----------------------------------------------------------------------------

@app.route('/Add_offer')
def add_offer_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']

    Add_Offer = pages.Add_Offer(Id_User)
    return render_template('DB_Add_Offers.html', data=Add_Offer.data)


@app.route('/Add_offers_to_DB', methods=['POST'])
def add_Offers():
    data = dict()
    Add_Offer = pages.Add_Offer(session['Id_User'])
    if request.method == 'POST':
        data['Id_Item'] = request.form['Product_id']
        data['New_Price'] = request.form['new_price']
        data['End_Date'] = request.form['end_date']
        data['End_Date'] = data['End_Date'].replace('/', '-')
        data['Type'] = request.form['type']
        Add_Offer.add_offers(**data)

    return redirect(url_for('add_offer_Page'))


# ----------------------------------------------------------------------------

@app.route('/Add_payment')
def add_payment_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']

    Add_Payment = pages.Add_Payment(Id_User)
    return render_template('DB_Add_Payment.html', data=Add_Payment.data)


@app.route('/Add_payments_to_DB', methods=['POST'])
def add_Payment():
    data = dict()
    Add_Payment = pages.Add_Payment(session['Id_User'])
    if request.method == 'POST':
        data['Id_User'] = session['Id_User']
        data['Id_Student'] = request.form['Student_id']
        data['Payment'] = request.form['Payment']
        data['Payoff'] = request.form['Payoff']

        Add_Payment.add_payments(**data)

    return redirect(url_for('add_city_uni_spe_Page'))

# ----------------------------------------------------------------------------

@app.route('/Add_City_Uni_Spel')
def add_city_uni_spe_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']

    Add_City_uni_spe = pages.Add_City_Uni_Spel(Id_User)
    return render_template('DB_Add_City_Uni_Spel.html', data=Add_City_uni_spe.data)


@app.route('/Add_city_to_DB', methods=['POST'])
def add_City():
    data = dict()
    Add_City_uni_spe = pages.Add_City_Uni_Spel(session['Id_User'])
    if request.method == 'POST':
        data['Name'] = request.form['city_name']

        Add_City_uni_spe.add_city(**data)

    return redirect(url_for('add_city_uni_spe_Page'))


@app.route('/Add_university_to_DB', methods=['POST'])
def add_University():
    data = dict()
    Add_City_uni_spe = pages.Add_City_Uni_Spel(session['Id_User'])
    if request.method == 'POST':

        data['Name'] = request.form['university_name']

        Add_City_uni_spe.add_university(**data)

    return redirect(url_for('add_city_uni_spe_Page'))


@app.route('/Add_specialization_to_DB', methods=['POST'])
def add_Specialization():
    data = dict()
    Add_City_uni_spe = pages.Add_City_Uni_Spel(session['Id_User'])
    if request.method == 'POST':

        data['Name'] = request.form['specialization']

        Add_City_uni_spe.add_specializaton(**data)

    return redirect(url_for('add_city_uni_spe_Page'))


# ----------------------------------------------------------------------------

@app.route('/display_Student')
def Display_Student_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']

    display_Student = pages.Display_Student(Id_User)
    return render_template('DB_Student_Table.html', data=display_Student.data)


# ----------------------------------------------------------------------------

@app.route('/display_Item')
def Display_Item_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']

    display_Item = pages.Display_Item(Id_User)
    return render_template('DB_Item_Table.html', data=display_Item.data)


# ----------------------------------------------------------------------------

@app.route('/display_Class')
def Display_Class_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']

    display_Class = pages.Display_Class(Id_User)
    return render_template('DB_Class_Table.html', data=display_Class.data)

# ----------------------------------------------------------------------------

@app.route('/display_Course')
def Display_Course_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']

    display_Course = pages.Display_Course(Id_User)
    return render_template('DB_Course_Table.html', data=display_Course.data)


# ----------------------------------------------------------------------------

@app.route('/display_Post')
def Display_Post_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']

    display_Post = pages.Display_Post(Id_User)
    return render_template('DB_Post_Table.html', data=display_Post.data)


# ----------------------------------------------------------------------------

@app.route('/display_Payment')
def Display_Payment_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']

    display_Payment = pages.Display_Payment(Id_User)
    return render_template('DB_Payment_Table.html', data=display_Payment.data)


# ----------------------------------------------------------------------------

@app.route('/display_Offer')
def Display_Offer_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']

    display_Offer = pages.Display_Offer(Id_User)
    return render_template('DB_Offer_Table.html', data=display_Offer.data)


# ----------------------------------------------------------------------------

@app.route('/display_User_info')
def Display_User_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']

    display_user = pages.Account(Id_User)
    return render_template('DB_User_Profile.html', data=display_user.data)


# ----------------------------------------------------------------------------

@app.route('/display_Tables')
def Display_Table_Page():
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']

    display_user = pages.Account(Id_User)
    return render_template('DB_Tables.html', data=display_user.data)

# ==============================================================================
# =============================================================================


@app.route('/delete_student/<id_student>')
def Delete_Student_Page(id_student):
    if 'Id_User' not in session:
        return redirect(url_for('Home_Page'))

    Id_User = session['Id_User']
    delete_user = pages.Delete_Student(Id_User)

    delete_user.Del_student(int(id_student))
    return redirect(url_for('Display_Student_Page'))












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