import mysql.connector

#clase de conexion
class Conexion:

    def __init__(self):
        self.db = mysql.connector.connect(host="localhost", user="root", passwd="123456" , database="torneo",auth_plugin='mysql_native_password')

    def conectar(self):
        cur = self.db.cursor()
        return cur

    def commit(self):
        self.db.commit()

    #def insertar(self):
    def desconectar(self):
        self.db.close()



