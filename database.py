"""
Establish a connection with the database Mysql
"""
# MY SQL 
import pymysql
import config as con


class DataBase () :
    def __init__ (self, host=con.host_DB, username=con.username, password=con.password, database=con.database):
        try:
            # Connect to the DataBase Dashpord
            self.connection = pymysql.connect(host=host,# Server
                                         user=username,# your username
                                         password=password)#your password
            self.mycursor = self.connection.cursor()

        except:
            print ('Error information  Connection')
        if database != None:
            databases = self.mycursor.execute('SHOW DATABASES')
            databases = self.mycursor.fetchall()
            self.connection.commit()
            data = list()
            for database_ in databases :
                data.append(database_[0])
            if database in  data :             
                    # Connect to the DataBase
                    self.connection = pymysql.connect(host=host,#Server
                                                 user=username, #your username
                                                 password=password,
                                                 db=database)#your password
                
                    self.mycursor = self.connection.cursor()
            else : 
                print ('The Database ({}) is not Found'.format(database))

    def create_New_database (self ,Name :str ) : 
            #CREATE DATABASE
            sql ="CREATE DATABASE {} ; ".format(Name)
            self.mycursor.execute(sql)
            self.connection.commit()
            return ''

    def create_New_Table (self , Name : str  , coulmns :tuple) :
        #Create New Table 
        sql = "CREATE TABLE {} {} ; ".format(Name,coulmns )
        sql=sql.replace('\'',' ')
        self.mycursor.execute(sql)
        self.connection.commit()        

    def Insert_Data (self ,table,**value) : 
        """
        """
        name=str(tuple(value.keys()))
        name=name.replace('\'',' ')
        sql="INSERT INTO "+table+" "+name+" VALUES "+str(tuple(value.values()))
        mycursor = self.connection.cursor()
        mycursor.execute(sql)  
        self.connection.commit()

    def Select_Data_One_Row (self,sql) :
        """
        """
        mycursor = self.connection.cursor()
        mycursor.execute(sql)
        data =mycursor.fetchone()
        self.connection.commit()
        return data

    def Select_Data_More_Row (self,sql) : 
        """
        """
        mycursor = self.connection.cursor()
        mycursor.execute(sql)
        data =mycursor.fetchall()
        self.connection.commit()
        return data
        
    def Update_Data_All_Coulmn_String(self, table, Id, **value):
        items=''
        i=0
        for name, val in value.items():
            i=i+1
            if (i < len(value.keys())) :
                items=items+str(name)+' = '+'\''+str(val)+'\''+' , '
            else :
                items=items+str(name)+' = '+'\''+str(val)+'\''

        sql="UPDATE {} SET {} WHERE Id={} ;".format(table,items,Id)
        print(sql)
        mycursor = self.connection.cursor()
        mycursor.execute(sql)  
        self.connection.commit()
                        
    def Update_Data_one_Coulmn (self,table,Id,name,value) : 
        sql="UPDATE {} SET {} ='{}' WHERE Id={} ;".format(table,name,value,Id)
        mycursor = self.connection.cursor()
        mycursor.execute(sql)  
        self.connection.commit()

    def Delete_Data (self,table,name,value) : 
        sql ="DELETE FROM {} WHERE {}='{}' ;".format(table,name,value)
        mycursor = self.connection.cursor()
        mycursor.execute(sql)  
        self.connection.commit()


