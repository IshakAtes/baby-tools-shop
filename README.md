# Baby Tools E-commerce Project 🛒

This project demonstrates a fully functional e-commerce application developed with Django to manage and display baby products. Below is a comprehensive guide to setting up, running, and deploying the project using Docker.

[Show Checklist](https://github.com/IshakAtes/baby-tools-shop/blob/e5058f5378bc5a7544a49b7fb9bde3c15625a7dd/Checkliste_Baby_Tools_Shop.pdf)

---

## Quickstart ⚡️
If you're in a hurry to see the project live, follow these minimal steps:
1. Clone the repository:
``` bash
git clone https://github.com/UserName/baby-tools-shop.git
cd baby-tools-shop #go to directory
```

2. Create the .env file:
``` bash
echo "SERVER_IP=<SECRET_IP_ADRESS>" > .env
```

3. Build and run the Docker container:
``` bash
docker build -t baby-tools-shop .
docker run -d --env-file .env -p 8025:8025 baby-tools-shop
```

4. Access the application:
Visit `http://<SECRET_IP_ADRESS>:8025` in your browser.

5. Create a Django Admin User (Optional):
``` bash
docker exec -it <CONTAINER_ID> /bin/bash
python manage.py createsuperuser
```

#### That's it! 🎉 The project is now up and running.

---

## Table of Contents  

1. [Quickstart](#quickstart-️)
2. [Technologies](#technologies-)  
3. [Hints](#hints)  
4. [Photos](#photos-️)  
5. [Setup Instructions](#setup-instructions-)  
   - [Step 1: Create Dockerfile](#step-1-create-dockerfile-)  
   - [Step 2: Configure Django Allowed Hosts](#step-2-open-the-settingspy-in-babyshop_app-and-add-this-to-allowed-host)  
   - [Step 3: Install Git on the Server](#step-3-install-git-on-the-server-if-not-available)  
   - [Step 4: Clone Repository on Server](#step-4-clone-repository)  
   - [Step 5: Create the .env File](#step-6-create-and-run-a-docker-image-)  
   - [Step 6: Create Docker Image](#step-6-create-and-run-a-docker-image-)  
   - [Step 7: Start Docker Container](#step-7-start-docker-container-)  
   - [Step 8: Test Application](#step-8-checking-the-application)  
   - [Step 9: Create Django Admin User](#step-9-create-a-superuser-admin)  
   - [Step 10: Add Products](#step-10-after-you-have-logged-in-you-can-add-some-products-to-avoid-seeing-a-blank-page-after-publication-and-to-check-if-it-worked)   
5. [Project Structure](#-project-structure)  
6. [Configuration and Important Rules](#️-configuration-and-important-rules)  
7. [License](#-license)  
8. [Acknowledgments](#-acknowledgments)  
9. [Conclusion](#conclusion)  


---

## Technologies 🔧

- **Python 3.9**  
- **Django 4.0.2**  
- **Git**  
- **Docker**  

---

## Hints  

- **Settings & Configuration**: Found in `babyshop_app/babyshop/settings.py`.  
- **Routing**: Check `urls.py` files in `babyshop` directorie.

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

### Step 1: Create Dockerfile 🐳

``` bash
# 1. Starte mit einem Base-Image
FROM python:3.9-slim

# 2. Setze das Arbeitsverzeichnis im Container
WORKDIR /app

# 3. Kopiere notwendige Projektdateien und Abhängigkeiten in den Container
COPY requirements.txt /app/
COPY ./babyshop_app /app

# 4. Installiere python-dotenv, um .env-Dateien zu laden (falls du es benötigst)
RUN pip install python-dotenv

# 5. Installiere alle Abhängigkeiten
RUN pip install -r requirements.txt

# 6. Sammle die statischen Dateien
# RUN python manage.py collectstatic --noinput

# 7. Exponiere den Port, auf dem die Anwendung läuft
EXPOSE 8025

# Variable mit der ip
ENV SERVER_IP=localhost

# 8. Starte die Anwendung
CMD ["python", "manage.py", "runserver", "0.0.0.0:8025"]
```



### Step 2: Open the settings.py in babyshop_app and add this to allowed host:
``` python
from dotenv import load_dotenv
import os
load_dotenv()

ALLOWED_HOSTS = [os.getenv("SERVER_IP", 'localhost')]
```


### Step 3: Install Git on the server (if not available)
```bash
sudo apt update  
sudo apt install git -y
```


### Step 4: Clone repository
Change to the desired directory on the server and clone your Git repository:
```bash
git clone https://github.com/UserName/baby-tools-shop.git
cd baby-tools-shop
```

``` bash
cd baby-tools-shop
```


### Step 5: This command creates a `.env` file and writes the `SERVER_IP` environment variable with the value `<SECRET_IP_ADRESS`. This file is used to store configuration values securely outside the source code. Here is an [example](https://github.com/IshakAtes/baby-tools-shop/blob/main/.envExample)
``` bash
echo "SERVER_IP=<SECRET_IP_ADRESS>" > .env
```



### Step 6: Create and run a Docker image 🐳
Creates a Docker image with the tag `baby-tools-shop` based on the Dockerfile in the current directory (.)
- docker build: The command to create (build) a Docker image.
- -t baby-tools-shop: Specifies the name (baby-tools-shop) and optionally a tag (version number) for the image. The -t stands for “tag”.
- . (dot): Specifies the current directory as the context for the build process. Docker searches this directory for a file called Dockerfile, which contains instructions for creating the image.
``` bash
docker build -t baby-tools-shop .
```



### Step 7: Start Docker container 🐳
The command docker run -d --env-file .env -p 8025:8025 baby-tools-shop is used to start a Docker container. Here's a breakdown of each part:
- `docker run`: Starts a new container based on a Docker image.
- `-d`: Runs the container in detached mode (in the background), so your terminal stays free.
- `--env-file .env`: Loads environment variables from the `.env` file into the container.
- `-p 8025:8025`: Maps port 8025 on your machine to port 8025 inside the container, making the service available at `http://localhost:8025`.
- `baby-tools-shop`: The name of the Docker image used to create the container.
``` bash
docker run -d --env-file .env -p 8025:8025 baby-tools-shop
```



### Step 8: Checking the application
Call the server `IP` with port `8025` in the browser:
``` bash
http://<ip_adress>:8025/
```



### Step 9: Create a superuser 'Admin'
1. Find out the container ID
``` bash
docker ps
```

2. This command allows you to start an interactive Bash session inside a running Docker container. Replace `<CONTAINER_ID>` with the actual container ID or name.
``` bash
docker exec -it <CONTAINER_ID> /bin/bash
```

3. Create superuser in Django
``` bash
python manage.py createsuperuser
```

4. Follow the instructions to enter your user `name`, `e-mail` and `password`.
``` bash
Enter the required information:
Username (leave blank to use 'root'): admin
Email address: admin@test.de
Password: ********
Password (again): ********
Superuser created successfully.
```

5. Call up the admin panel:
``` bash
http://ip_adress:8025/admin
```
> [!Note]
> Log in with the superuser account you just created.



### Step 10: After you have logged in, you can add some products to avoid seeing a blank page after publication. And to check if it worked.




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
- **Containerization**: The Docker image makes the application portable and consistent across all environments.

- **Port Configuration:** The specification `0.0.0.0:8025` and Docker port mapping are crucial for external access.



## 📝 License
This project is licensed under the MIT License - see the [LICENSE](/baby-tools-shop/LICENSE) file for details.



## 🙏 Acknowledgments
- Django framework community<br>
- Contributors and testers<br>
- Python community<br>



## Conclusion
This project demonstrates a fully functional e-commerce application for Baby Tools Shop. By following the steps outlined, you can successfully run the application both locally and via Docker. The structured setup ensures ease of deployment and compatibility across different environments.<br>
Happy Coding! 🚀