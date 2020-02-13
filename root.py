# -*- coding: utf-8 -*-
import config as con
from flask import Flask , request ,url_for , redirect ,session , jsonify
from flask import render_template
import pages



app = Flask(__name__ )
# for session
app.secret_key = 'YYYY@#$%'


@app.route('/')
def index():
    return redirect(url_for('Home_Page'))


@app.route('/home')
def Home_Page():
    Home_Class = pages.Home()
    return render_template('home.html', data=Home_Class.data)

@app.route('/category=<id_category>/page=<page>')
def Category_Page(id_category , page ):
    Category_Class = pages.Category(int (id_category) , int(page ) )
    return render_template('products.html', data=Category_Class.data)

@app.route('/products/page=<page>')
def products_Page(page):
    Products_Class = pages.Products(int (page) )
    return render_template('products.html', data=Products_Class.data)



@app.route('/product/<Id>')
def product_Page(Id):
    Product_Class = pages.Product(Id)
    return render_template('product-detail.html', data=Product_Class.data)

@app.route('/faqs')
def Faqs_Page():
    FAQ_Class = pages.FAQ()
    return render_template('faqs.html', data=FAQ_Class.data)


@app.route('/login')
def Login_Page():
    Login_Class = pages.Home()
    return render_template('login.html', data=Login_Class.data)


@app.route('/sinup')
def Sinup_Page():
    Sinup_Class = pages.Sinup()
    return render_template('register.html', data=Sinup_Class.data)


@app.route('/register', methods=['POST'])
def register_data():
    data = dict()
    data['FirstName'] = request.form['firstname']
    data['LastName'] = request.form['lastname']
    data['Email'] = request.form['email']
    data['Phone'] = request.form['telephone']
    data['Gender'] = request.form['newsletter']
    data['Address'] = request.form['country_id']
    data['birthday'] = request.form['birthday']
    data['Birthday'] = data['Birthday'].replace('/', '-')
    data['Image'] = request.files['Image']
    data['password'] = request.form['password']



    Home_Class = pages.Home()

    return render_template('home.html', data=Home_Class.data)


@app.route('/courses/page=<page>')
def Courses_Page(page):
    courses_Class = pages.Courses (page)
    return render_template('posts.html', data=courses_Class.data)


@app.route('/achievements/page=<page>')
def Achievements_Page(page):
    Achievements_Class = pages.Achievements(page)
    return render_template('posts.html', data=Achievements_Class.data)


@app.route('/post/<Id_post>')
def Post_Page(Id_post):
    Post_Class = pages.Post(int (Id_post) )
    return render_template('post-detail.html', data=Post_Class.data)



@app.route('/about')
def About_Page():
    About_Class = pages.About()
    return render_template('about.html', data=About_Class.data)


@app.route('/ForgottenPassword')
def ForgottenPassword_Page():
    pass


@app.route('/TTADP')
def Dashboard_Page():
    pass
    pass


if __name__ == '__main__':
    app.run(debug=con.debug, port=con.port, host=con.host)