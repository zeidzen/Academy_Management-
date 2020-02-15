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



@app.route('/product/<Id_product>')
def product_Page(Id_product):
    Product_Class = pages.Product(int (Id_product))
    return render_template('product-detail.html', data=Product_Class.data)


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
    Courses_Class = pages.Courses (page)
    return render_template('courses.html', data=Courses_Class.data)


@app.route('/course/<Id_Course>')
def Course_Page(Id_Course):
    Course_Class = pages.Course (int (Id_Course))
    return render_template('courses-detail.html', data=Course_Class.data)


@app.route('/achievements/page=<page>')
def Achievements_Page(page):
    Achievements_Class = pages.Achievements(page)
    return render_template('posts.html', data=Achievements_Class.data)


@app.route('/post/<Id_post>' )
def Post_Page(Id_post):
    Post_Class = pages.Post(int (Id_post) )
    return render_template('post-detail.html', data=Post_Class.data)

@app.route('/search' , methods =['POST'] )
def Search():
    if  request.method=='POST' : 
        Search = request.form['search']   
        return redirect(url_for('Search_Page' ,search =Search , page =1 ))
        #return redirect(url_for('Home_Page'))
    else : 
        return redirect(url_for('Home_Page'))


@app.route('/search/page=<page>')
def Search_Page(search , page = 1 ):
        Search_Class = pages.Search(Search , int (page) )
        return render_template('search.html', data=Search_Class.data)

    
    

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
    
@app.route('/faqs')
def Faqs_Page():
    FAQ_Class = pages.FAQ()
    return render_template('faqs.html', data=FAQ_Class.data)


@app.errorhandler(404)
def page_not_found(error):
    Error404_class=pages.Error_page()
    return render_template ('404.html',data = Error404_class.data)




if __name__ == '__main__':
    app.run(debug=con.debug, port=con.port, host=con.host)