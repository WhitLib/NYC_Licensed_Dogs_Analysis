#practice dashboard explainer
#practice with out own data
import pandas as pd
import datetime as dt
from sklearn.ensemble import RandomForestClassifier
from sklearn import tree
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix, accuracy_score, classification_report

from explainerdashboard import ClassifierExplainer, ExplainerDashboard
from flask import Flask, render_template


#create a flask app
app = Flask(__name__)

#import our encoded dataframe
file_path = "Resources/dogs_encoded.csv"
dogs_enc_df = pd.read_csv(file_path)

#define the features
#NOTE: many of the features directly relate to where the dog is from (ie ZIP code, districts, etc), I've removed these to make it harder for the model to guess
X = dogs_enc_df.copy()
X = X[["AnimalName", "BreedName","AnimalBirthMonth", "LicenseIssuedDate", "gender_enc"]]
y = dogs_enc_df["Borough_enc"]

#test train split
X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=42)

#create the model
model = RandomForestClassifier(n_estimators=50, max_depth=5)
model.fit(X_train, y_train)

#create the explainer instance, needs X_test and y_test
explainer = ClassifierExplainer(
                model, X_test, y_test,
                # optional:
                #cats=['AnimalName', 'BreedName', 'Borough_enc'],
                labels=['Bronx', 'Brooklyn', 'Manhattan', 'Queens', 'Staten Island']
)

db = ExplainerDashboard(explainer, title="NYC_Dogs_Dash",
                    whatif=False, # you can switch off tabs with bools
                    shap_interaction=False,
                    decision_trees=False,
                    server=app, 
                    url_base_pathname="/dashboard/")


#this page works!!
@app.route('/')
def home():
   return render_template('index.html')

#this will host the ml model
@app.route('/dashboard')
def return_dashboard():
    return db.app.index()

#include this
if __name__ == "__main__":
    app.run(debug=True)

