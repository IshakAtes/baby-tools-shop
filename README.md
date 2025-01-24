# E-Commerce Project For Baby Tools

### TECHNOLOGIES

- Python 3.9
- Django 4.0.2
- Venv

### Hints

This section will cover some hot tips when trying to interacting with this repository:

- Settings & Configuration for Django can be found in `babyshop_app/babyshop/settings.py`
- Routing: Routing information, such as available routes can be found from any `urls.py` file in `babyshop_app` and corresponding subdirectories

### Photos

##### Home Page with login

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080815407.jpg"></img>
##### Home Page with filter
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080840305.jpg"></img>
##### Product Detail Page
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080934541.jpg"></img>

##### Home Page with no login
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080953570.jpg"></img>


##### Register Page

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081016022.jpg"></img>


##### Login Page

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081044867.jpg"></img>



Schritt-1 repository gecloned

Schritt 2 environtment erstellt und aktiviert mit dem befehl
create env
python -m venv env

activate environment in vs-code command prompt or cmd (not powershell):
"env/Scripts/activate"

install django
python -m pip install Django


Schritt 3
Dockerfile erstellen


Dockerimage erstellen:

Unsere Anwendung läuft bei uns lokal auf dem Rechner, aber es kann sein das es bei jemandem anderen der eine andere python oder
django version hat nicht läuft. Es kann sein das unser projekt mit einer alten python version nicht so gut läuft. 
Damit jetzt aber die Anwendung reibungslos auf dem Server läuft, wie bei uns. Packen wir alle unsere installierten anwedungen (python, django, docker etc)
mit der richtigen version , die bei uns auch funktioniert in eine environment ordner. Diese angegeben anwendungen werden dann mit der zusamm abhängigen version auf dem server installiert, 
damit es auch auf dem server läuft. Ähnlich wie bei firebase package.json und package-lock.json

bash:
pip freeze

bash:
pip freeze > requirements.txt



