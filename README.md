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

2. Build and run the Docker container:
``` bash
docker build -t baby-tools-shop .
docker run -d -p 8025:8025 baby-tools-shop
```

3. Access the application:
Visit `http://localhost:8025` in your browser.

4. Create a Django Admin User (Optional):
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
   - [Step 2: Update Django Allowed Hosts](#step-2-open-the-settingspy-in-babyshop_app-and-add-this-to-allowed-host)  
   - [Step 3: Update Git Repository](#step-3-update-git-again-or-bring-it-up-to-date)  
   - [Step 4: Connect with the Server](#step-4-connect-with-the-server)  
   - [Step 5: Install Git on the Server](#step-5-install-git-on-the-server-if-not-available)  
   - [Step 6: Clone Repository on Server](#step-6-clone-repository)  
   - [Step 7: Install Requirements](#step-7-install-your-requirements)  
   - [Step 8: Create Docker Image](#step-8-create-and-run-a-docker-image-)  
   - [Step 9: Start Docker Container](#step-9-start-docker-container-)  
   - [Step 10: Test Application](#step-10-checking-the-application)  
   - [Step 11: Create Django Admin User](#step-11-create-a-superuser-admin)  
   - [Step 12: Add Products](#step-12-after-you-have-logged-in-you-can-add-some-products-to-avoid-seeing-a-blank-page-after-publication-and-to-check-if-it-worked)   
5. [Project Structure](#-project-structure)  
6. [Configuration and Important Rules](#️-configuration-and-important-rules)  
7. [License](#-license)  
8. [Acknowledgments](#-acknowledgments)  
9. [Conclusion](#conclusion)  


---

## Technologies 🔧

- **Python 3.9**  
- **Django 4.0.2**  
- **Venv**  
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



### Step 2: Open the settings.py in babyshop_app and add this to allowed host:
``` python
ALLOWED_HOSTS = ['<ip-adress>', '127.0.0.1', 'localhost']
```


### Step 3: Update Git again or bring it up to date
``` bash
git pull
git add .
git commit -m "commit_description"
git push -u origin branch_name
```


### Step 4: Connect with the server
Connect to your server using `SSH`:
``` bash
ssh -i ~/.ssh/ssh-key username@ip-adress
```


### Step 5: Install Git on the server (if not available)
```bash
sudo apt update  
sudo apt install git -y
```


### Step 6: Clone repository
Change to the desired directory on the server and clone your Git repository:
```bash
git clone https://github.com/UserName/baby-tools-shop.git
cd baby-tools-shop
```

``` bash
cd baby-tools-shop
```



### Step 8: Create and run a Docker image 🐳
Creates a Docker image with the tag `baby-tools-shop` based on the Dockerfile in the current directory (.)
- docker build: The command to create (build) a Docker image.
- -t baby-tools-shop: Specifies the name (baby-tools-shop) and optionally a tag (version number) for the image. The -t stands for “tag”.
- . (dot): Specifies the current directory as the context for the build process. Docker searches this directory for a file called Dockerfile, which contains instructions for creating the image.
``` bash
docker build -t baby-tools-shop .
```



### Step 9: Start Docker container 🐳
The command docker run -d -p 8025:8025 baby-tools-shop is used to start a Docker container. Here's a breakdown of each part:
- docker run: Starts a new container based on a Docker image.
- -d: Runs the container in detached mode (in the background), so the terminal remains available.
- -p 8025:8025: Maps port 8025 on the host machine to port 8025 inside the container, making the service accessible via http://localhost:8025.
- baby-tools-shop: The name of the Docker image used to create the container.
``` bash
docker run -d -p 8025:8025 baby-tools-shop
```



### Step 10: Checking the application
Call the server `IP` with port `8025` in the browser:
``` bash
http://<ip_adress>:8025/
```



### Step 11: Create a superuser 'Admin'
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
Benutzername: admin
E-Mail-Adresse: admin@test.com
Passwort: ********
Passwort (again): ********
```

5. Call up the admin panel:
``` bash
http://ip_adress:8025/admin
```
> [!Note]
> Log in with the superuser account you just created.



### Step 12: After you have logged in, you can add some products to avoid seeing a blank page after publication. And to check if it worked.




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

- **Isolation:** The virtual environment (`venv`) separates project dependencies from the system Python.

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



## settings.py
import os

ALLOWED_HOSTS = [os.getenv("SERVER_IP", "127.0.0.1"), 'localhost']


create .env file
SERVER_IP=49.13.207.228




