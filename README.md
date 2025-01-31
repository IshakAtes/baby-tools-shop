# Baby Tools E-commerce Project 🛍️

A comprehensive project showcasing an e-commerce application built with Django, designed for managing and displaying baby tools. This guide walks through the steps for setting up, running, and deploying the project using Docker.  

---

## Table of Contents  

1. [Technologies](#technologies-)  
2. [Hints](#hints)  
3. [Photos](#photos-️)  
4. [Setup Instructions](#setup-instructions-)  
   - [Step 1: Clone the Project](#step-1-clone-the-project)  
   - [Step 2: Create a Virtual Environment](#step-2-create-a-python-virtual-environment)  
   - [Step 3: Install Python Dependencies](#step-3-install-python-dependencies)  
   - [Step 4: Test the Project Locally](#step-4-test-project-locally)  
   - [Step 5: Create a Dockerfile](#step-5-create-dockerfile)  
   - [Step 6: Build and Run Docker Image](#step-6-docker-setup-)  
   - [Step 7: Check the Website](#step-7-check-the-website)  
5. [Project Structure](#-project-structure)
5. [Configuration](#️-configuration)
5. [License](#-license)
5. [Acknowledgments](#-acknowledgments)  
5. [Conclusion](#conclusion)  

---

## Technologies 🔧

- **Python 3.9**  
- **Django 4.0.2**  
- **Venv**  

---

## Hints  

- **Settings & Configuration**: Found in `babyshop_app/babyshop/settings.py`.  
- **Routing**: Look for routing information in any `urls.py` file located in `babyshop_app` or its subdirectories.  

---

## Photos 🖼️ 

### Home Page (Logged In)  
![Home Page with Login](https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080815407.jpg)  

### Home Page (With Filter)  
![Home Page with Filter](https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080840305.jpg)  

### Product Detail Page  
![Product Detail Page](https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080934541.jpg)  

### Home Page (Without Login)  
![Home Page Without Login](https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080953570.jpg)  

### Register Page  
![Register Page](https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081016022.jpg)  

### Login Page  
![Login Page](https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081044867.jpg)  

---

## Setup Instructions 🚀

### Step 1: Clone the Project  

Open a terminal (PowerShell, CMD or Git Bash) and enter the following command to clone the repository:
``` bash
git clone https://github.com/IshakAtes/baby-tools-shop.git
```



### Step 2: Create a Python virtual environment
Our application runs locally on our computer, but it is possible that someone else who has a different python or
django version does not run. It is possible that our project does not run so well with an old python version. 
However, to ensure that the application runs smoothly on the server, we pack all dependent applications (python, django, docker etc)
with the correct version into the virtual environment. These specified applications are then installed on the server with the dependent version, 
so that it also runs on the server. Similar to firebase package.json and package-lock.json

Create a virtual environment:
``` bash
python -m venv venv
```

Activate the virtual environment:
``` bash
"venv/Scripts/activate"
```
> [!Note]
> Note: Use Command Prompt or VS Code's terminal, not PowerShell.



### Step 3: Install Python Dependencies
Check installed packages:
``` bash
pip freeze
```

Create a requirements file to store project dependencies:
``` bash
pip freeze > requirements.txt
```

the cloned application requires Django 4.0.2 according to the readme, therefore adjust the version in requirement.txt

Install the packages with pip install -r requirements.txt.
``` bash
pip install -r requirements.txt
```

> [!Note]
> if you have an old pip version, you can update it with this command:
> ``` bash
> pip install --upgrade pip
> ```


> [!Note] According to the error message, pillow is required for the cloned application. Therefore, we should first check which version of pillow is > compatible with our Python and Django version and then add it to 'requirements.txt' and run 'pip install -r requirements.txt' again.
``` bash
Django==4.0.2
Pillow==9.0.0
```

install requirements again
``` bash
pip install -r requirements.txt
```

Use pip freeze to check whether everything has been installed correctly.
``` bash
pip freeze
```


### Step 4 Test project locally
navigate to babyshop_app and execute the migrate command:
``` bash
(venv) C:\Users\user-directory\Desktop\DevSecOps\baby-tools-shop\babyshop_app>
```

1. Perform database migrations:
``` bash
python manage.py migrate
```

2. Start the local server:
``` bash
python manage.py runserver
```

3. Open your browser and go to:
``` bash
http://127.0.0.1:8000
```
> [!Note]
> Note: Check that the page is displayed correctly.



### Step 5: Create Dockerfile

``` bash
# 1 Start with a base image
FROM python:3.9-slim

# 2 Set the working directory in the container
WORKDIR /app

# 3. copy requirements.txt into the Docker image
COPY requirements.txt /app/

# 4 Install all dependencies
RUN pip install -r requirements.txt

# 5 Copy the project files into the container
COPY ./babyshop_app /app

# 6. Sammle die statischen Dateien
RUN python manage.py collectstatic --noinput

# 7. Exponiere den Port, auf dem die Anwendung läuft
EXPOSE 8025

# 8. Starte die Anwendung
CMD ["python", "manage.py", "runserver", "0.0.0.0:8025"]
```
> [!Note]
> The file should be located as a 'Dockerfile' in the main project folder.



### Step 6: Docker Setup 🐳

1. Open Docker Desktop and let it run in the background. Then return to your vs-code or terminal

2. Build the Docker image:
``` bash
docker build -t baby-tools-shop .
```

3. Launch the container:
``` bash
docker run -p 8025:8025 baby-tools-shop
```


### Step 7: Check the website
Open your browser and go to:
``` bash
http://localhost:8025
```


## 📁 Project Structure
``` bash
baby-tools-shop/
├── babyshop_app/
│   ├── babyshop/
│   │   ├── settings.py
│   │   └── urls.py
│   └── manage.py
├── requirements.txt
├── Dockerfile
└── README.md
```

## ⚙️ Configuration
Key configuration files:

- `babyshop_app/babyshop/settings.py`: Main Django settings
- `requirements`.txt: Python dependencies
- `Dockerfile`: Docker configuration



## 📝 License
This project is licensed under the MIT License - see the LICENSE file for details.



## 🙏 Acknowledgments
Django framework community<br>
Contributors and testers<br>
Python community<br>



## Conclusion
This project demonstrates a fully functional e-commerce application for Baby Tools Shop. By following the steps outlined, you can successfully run the application both locally and via Docker. The structured setup ensures ease of deployment and compatibility across different environments.<br>
Happy Coding! 🚀



Schritt 9 Superuser erstellen
-activate
"venv/Scripts/activate"

-navigate to the path in there is the django app
(venv) C:\Users\ishak\OneDrive\Desktop\DevSecOps\baby-tools-shop\babyshop_app>

-erstelle einen superuser mit dem befehl
python manage.py createsuperuser

Gib die erforderlichen Informationen ein:
Benutzername: admin
E-Mail-Adresse: admin@example.com
Passwort: ********


Starte den Server, um das Admin-Panel zu testen:
python manage.py runserver


Admin-Panel aufrufen:
Gehe im Browser zu:
http://127.0.0.1:8000/admin
Melde dich mit dem gerade erstellten Superuser-Konto an.

### Du kannst, nachdem du dich eingeloggt hast, Einige produkte hinzufügen um nach der veröffentlichung keine leere seite zu sehen. Und um zu prüfen ob es auch geklappt hat.


<!-- DIESER PART KANN EVENTUELL ÜBERSPRUNGEN WERDEN -->
### Step 10 Test project locally
navigate to babyshop_app and execute the migrate command:
``` bash
(venv) C:\Users\user-directory\Desktop\DevSecOps\baby-tools-shop\babyshop_app>
```

1. Perform database migrations:
``` bash
python manage.py migrate
```

2. Start the local server:
``` bash
python manage.py runserver
```

3. Open your browser and go to:
``` bash
http://127.0.0.1:8000
```
> [!Note]
> Note: Check that the page is displayed correctly.


### führe einen push auf git durch
https://github.com/IshakAtes/baby-tools-shop.git


Schritt 1: Zugang zum Server herstellen
Verbinde dich per SSH mit deinem Server:
ssh -i ~/.ssh/demo-server iates@49.13.207.228


Schritt 2: Git auf dem Server installieren (falls nicht vorhanden)
sudo apt update  
sudo apt install git -y


Schritt 3: Repository klonen
Wechsle in das gewünschte Verzeichnis auf dem Server und klone dein Git-Repository:

git clone https://github.com/yourusername/baby-tools-shop.git
cd baby-tools-shop



Schritt 4: Docker Build und Run
Baue und starte deinen Container direkt vom aktuellen Commit:
docker build -t baby-tools-shop .  
docker run -d -p 8025:8025 baby-tools-shop


Schritt 6: Überprüfung
Rufe die IP deines Servers im Browser auf:



schritt 6
In babyshop_app die settings.py öffnen und bei allowed host das hinzufügen:
ALLOWED_HOSTS = ['49.13.207.228']

Django debugmode turn false
baby-tools-shop -> babyshop_app -> settings.py
DEBUG = False

änderungen auf git pushen

und auf dem server pullen

requirements installieren. wenn es nicht funktioniert check deine python --version
python3 --version

sudo apt update
sudo apt install python3-pip


you must be in file baby-tools-shop cd..
pip3 install -r requirements.txt


sudo kill -9 3824021 3824026

docker build -t baby-tools-shop .