# 📝 Django To-Do List Website

This is a basic **To-Do List Web Application** built using the **Django framework**. It was created as part of my learning journey into backend development, with the goal of understanding the foundational principles of web application architecture using Django.

## 🚀 About the Project

This project allowed me to:

- Grasp the core concepts of Django such as views, models, templates, and URL routing.
- Work with relational databases, specifically **PostgreSQL**, for data persistence.
- Understand the fundamentals of web form handling and CRUD operations.
- Begin exploring full-stack application development.

## 📦 Tech Stack

- **Backend Framework:** Django (Python)
- **Database:** PostgreSQL
- **Frontend:** HTML, CSS (Basic)
- **Version Control:** Git & GitHub

## 🌐 Upcoming Plans

As part of extending this project and exploring **DevOps methodologies**, here's what I'm planning next:

- **Cloud Hosting:** Deploy the site to a cloud platform like AWS, Azure, or Heroku.
- **CI/CD Pipeline:** Set up an automated Continuous Integration and Continuous Deployment workflow to streamline updates and testing.
- **Dockerization:** Containerize the application using **Docker** to ensure consistent and portable environments.
- **Infrastructure as Code (IaC):** Use **Terraform** to automate and manage infrastructure, making the deployment process more scalable and reproducible.

## 📌 Features
Add, edit, and delete tasks

Mark tasks as completed

View list of active and completed tasks

Basic form validation and error handling

## 🤝 Contributing
This is a learning project, but contributions and suggestions are always welcome as I grow through feedback!

## 🛠 Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/HopzAlot/My-Todo.git
   cd My-Todo
   ```
2. **Create and activate a virtual environment:**

```bash
python -m venv venv
source venv/bin/activate   # On Windows: venv\Scripts\activate
```
3. **Install dependencies:**

```bash
pip install django
pip install psycopg2
pip install pillow
```
4. **Configure PostgreSQL database settings in settings.py**

5. **Run migrations:**

```bash
python manage.py makemigrations
python manage.py migrate
```
6. **Start the development server:**

```bash
python manage.py runserver
```
  
