# 1. import Flask
from flask import Flask, render_template
from explainerdashboard import ExplainerDashboard

#create a flask app
app = Flask(__name__)

#define the dashboard route
db = ExplainerDashboard(explainer, server=app, url_base_pathname="/dashboard/")

#define the home page
#this page will have the tableau graphs
@app.route('/')
def home():
   return render_template('index.html')

#define the machine learining explainer dashboard
#this will host the ml model
@app.route('/dashboard')
def return_dashboard():
    return db.app.index()


#include this
if __name__ == "__main__":
    app.run(debug=True)