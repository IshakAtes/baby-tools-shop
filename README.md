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
Unsere Anwendung läuft bei uns lokal auf dem Rechner, aber es kann sein das es bei jemandem anderen der eine andere python oder
django version hat nicht läuft. Es kann sein das unser projekt mit einer alten python version nicht so gut läuft. 
Damit jetzt aber die Anwendung reibungslos auf dem Server läuft, wie bei uns. Packen wir alle unsere installierten anwedungen (python, django, docker etc)
mit der richtigen version , die bei uns auch funktioniert in eine environment ordner. Diese angegeben anwendungen werden dann mit der zusamm abhängigen version auf dem server installiert, 
damit es auch auf dem server läuft. Ähnlich wie bei firebase package.json und package-lock.json

virtuelle umgebung erstellen
python -m venv venv

Aktiviere die virtuelle Umgebung.
activate environment in vs-code command prompt or cmd (not powershell):
"venv/Scripts/activate"

überprüfe was alles installiert ist:
pip freeze

erstelle requirements, damit alle abhängigkeiten später im container installiert werden können:
pip freeze > requirements.txt

Schritt 3 Django
die geclonte Anwendung benötigt Django 4.0.2, deshalb in requirement.txt die version anpassen

Installiere mit pip install -r requirements.txt die Pakete.
pip install -r requirements.txt

[!Note]
wenn du eine alte pip version hast, kannst du sie mit diesem befehl updaten:
pip install --upgrade pip

Schritt 4 pillow
pillow der requirements hinzufügen
Pillow==8.3.2

nochmal requirements installieren
pip install -r requirements.txt

Überprüfe mit pip freeze, ob alles korrekt installiert wurde.
pip freeze

Schritt 5 in die environtment migrieren
navigiere zum babyshop_app und führe den migrate befehl aus:
``` bash
(venv) C:\Users\ishak\OneDrive\Desktop\DevSecOps\baby-tools-shop\babyshop_app>python manage.py migrate
```
python manage.py migrate


Schritt 6  docker image erstellen
docker image erstellen:
docker build -t baby-tools-shop .


Schritt 7 docker run:
docker build -t baby-tools-shop .
