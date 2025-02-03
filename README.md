# Baby Tools E-commerce Project 🛒

This project demonstrates a fully functional e-commerce application developed with Django to manage and display baby products. Below is a comprehensive guide to setting up, running, and deploying the project using Docker.

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
- **Docker**  

---

## Hints  

- **Settings & Configuration**: Found in `babyshop_app/babyshop/settings.py`.  
- **Routing**: Check 'urls'.py files in 'babyshop' directorie.

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



### Step 8: Open the settings.py in babyshop_app and add this to allowed host:
``` python
ALLOWED_HOSTS = ['49.13.207.228', '127.0.0.1', 'localhost']
```



### Step 9: Update Git again or bring it up to date
``` bash
git pull
git add .
git commit -m "commit_description"
git push -u origin branch_name
```


### Step 10: Create access to the server
Connect to your server using SSH:
``` bash
ssh -i ~/.ssh/demo-server iates@49.13.207.228
```



### Step 11: Install Git on the server (if not available)
```bash
sudo apt update  
sudo apt install git -y
```



### Step 12: Clone repository
Change to the desired directory on the server and clone your Git repository:
```bash
git clone https://github.com/UserName/baby-tools-shop.git
cd baby-tools-shop
```

``` bash
cd baby-tools-shop
```

---


> [!Note] Update package manager pip, if you enter 'docker build -t baby-tools-shop .' and get the message '[notice] A new release of pip is available', this indicates that a newer pip version is available.
``` bash
pip install --upgrade pip
```



### Step 13: Install your requirements
you must be in file baby-tools-shop cd ..
``` bash
pip install -r requirements.txt
```


### Step 14: Create and run a Docker image
Creates a Docker image with the tag 'baby-tools-shop' based on the Dockerfile in the current directory (.)
``` bash
docker build -t baby-tools-shop .
```



### Step 15: Start Docker container
``` bash
docker run -d -p 8025:8025 baby-tools-shop
```



### Step 16: Checking the application
Call the server IP with port 8025 in the browser:
http://49.13.207.228:8025/



### Step 17: Create a superuser 'Admin'
1. Find out the container ID
``` bash
docker ps
```

2. This command allows you to start an interactive Bash session inside a running Docker container. Replace <CONTAINER_ID> with the actual container ID or name.
``` bash
docker exec -it <CONTAINER_ID> /bin/bash
```

3. Create superuser in Django
``` bash
python manage.py createsuperuser
```

4. Follow the instructions to enter your user name, e-mail and password.
``` bash
Gib die erforderlichen Informationen ein:
Benutzername: admin
E-Mail-Adresse: admin@test.com
Passwort: ********
Passwort(wiederholung): ********
```

5. Call up the admin panel:
``` bash
http://ip_adresse:8025/admin
```
> [!Note]
> Log in with the superuser account you just created.



### Step 18: After you have logged in, you can add some products to avoid seeing a blank page after publication. And to check if it worked.




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

## ⚙️ Configuration and important rules
#### Key configuration files:

- `babyshop_app/babyshop/settings.py`: Main Django settings
- `requirements`.txt: Python dependencies
- `Dockerfile`: Docker configuration

#### Important Points

- <strong>Isolation:</strong> The virtual environment ('venv') separates project dependencies from the system Python.

- <strong>Containerization</strong>: The Docker image makes the application portable and consistent across all environments.

- <strong>Port Configuration:</strong> The specification '0.0.0.0:8025' and Docker port mapping are crucial for external access.



## 📝 License
This project is licensed under the MIT License - see the LICENSE file for details.



## 🙏 Acknowledgments
- Django framework community<br>
- Contributors and testers<br>
- Python community<br>



## Conclusion
This project demonstrates a fully functional e-commerce application for Baby Tools Shop. By following the steps outlined, you can successfully run the application both locally and via Docker. The structured setup ensures ease of deployment and compatibility across different environments.<br>
Happy Coding! 🚀
