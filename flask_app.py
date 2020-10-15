# A very simple Flask Hello World app for you to get started with...

from flask import Flask
from config import Conexion

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Test de Mostrar en Tablita en pythonanywhere'

@app.route('/test')
def test():
    conecta = Conexion()
    cur = conecta.conectar()
    cur.execute("SELECT * FROM usuario")
    data = cur.fetchone()
    print(data)
    return 'Test1' + str(data)

@app.route('/test2')
def test2():
    conecta = Conexion()
    cur = conecta.conectar()
    cur.execute("SELECT * FROM usuario")
    data = cur.fetchone()
    print(data)
    conecta.desconectar()
    return 'Test1'

if __name__ == "__main__":
    app.run(debug=True)

