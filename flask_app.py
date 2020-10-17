from flask import Flask , render_template,request, redirect, url_for, session , jsonify , flash, session
from config import Conexion
from funciones import  hasheo
import mysql.connector

app = Flask(__name__)
app.secret_key = 'CAMBIAR_LUEGO_POR_HEXADECIMALRANDOM'
encriptar = hasheo()

@app.route('/logout')
def logout():
    #Salir de Sesion
    session.clear()
    return redirect(url_for('index'))

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/login' ,methods=['GET','POST'] )
def login():
    if request.method == 'POST' and 'email' in request.form and 'password' in request.form:
        email = request.form['email']
        password = request.form['password']
        #Hash Seña
        clave = encriptar.encriptar(password)
        #Validar si existe user y seña.
        conecta = Conexion()
        cur = conecta.conectar()
        ejecucion = "SELECT * FROM usuarios WHERE email = %s and clave = %s"
        datos = (email,clave)
        cur.execute(ejecucion,datos)
        account = cur.fetchone()
        if not account:
            conecta.desconectar()
            mensaje = 'Alerta ,Usuario o Clave Incorrecto'
            flash(mensaje)
            return redirect(url_for('login'))
        else:
            session['loggedin'] = True
            session['id'] = account[0]
            session['nick'] = account[1]
            session['email'] = account[2]
            session['confirmado'] = account[5]
            session['nivel'] = account[6]
            conecta.desconectar()
            return redirect(url_for('index'))
    if request.method == 'GET':
        return render_template("login.html")

@app.route('/registro', methods=['GET','POST'])
def registro():
    # Variable Mensaje
    mensaje = ''
    #Validar los Datos Que llegan de register.html
    if request.method == 'POST' and 'nick' in request.form and 'nacionalidad' in request.form and 'email' in request.form and 'password1' in request.form  and 'password2' in request.form:
        #Obtener Variables
        nick = request.form['nick']
        psnid = request.form['playstation']
        nacionalidad = request.form['nacionalidad']
        email = request.form['email']
        password1 = request.form['password1']
        password2 = request.form['password2']
        #Validaciones
        if nacionalidad == '0':
            mensaje = 'Porfavor Seleccione Nacionalidad'
            flash(mensaje)
            return redirect(url_for('registro'))
        if password1 != password2:
            mensaje = 'Alerta , Las Contraseñas No Coinciden'
            flash(mensaje)
            return redirect(url_for('registro'))
        #Validacion de correo ya registrado.
        conecta = Conexion()
        cur = conecta.conectar()
        ejecucion = "SELECT * FROM usuarios WHERE EMAIL = '{email}'".format(email=email)
        cur.execute(ejecucion)
        email_existe = cur.fetchone()
        conecta.desconectar()
        if email_existe:
            mensaje = 'Alerta! , el correo ya fue registrado'
            flash(mensaje)
            return redirect(url_for('registro'))
        #Insercion de Nuevo Usuario.
        conecta = Conexion()
        cur = conecta.conectar()
        clave = encriptar.encriptar(password1)
        ejecucion = "INSERT INTO usuarios (nick,email,clave,nacionalidad,psnid)  values (%s,%s,%s,%s,%s)"
        datos=(nick,email,clave,nacionalidad,psnid)

        try:
            affected_count = cur.execute(ejecucion,datos)
            conecta.commit()
            data = "Se registro correctamente " + str(cur.rowcount) + " usuario : " + str(email)
            app.logger.info("|"+data)
        except mysql.connector.Error as error:
            data = "Fallo en Insercion de Registros " + format.error
            app.logger.info("|"+data)
        finally:
            conecta.desconectar()
        mensaje = 'Registro Satisfactorio'
        flash(mensaje)
        return redirect(url_for('login'))
    if request.method == 'GET':
        return render_template("register.html")
    return render_template("index.html")

if __name__ == "__main__":
    app.run(debug=True)

