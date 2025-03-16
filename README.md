# Course Management System (CMS)

A web-based system for managing courses, students, and teachers in an educational institution.

## Overview

The Course Management System (CMS) is a Java web application built with JSP and Servlets that provides a platform for administrators, teachers, and students to manage course-related activities. The system supports user authentication, course registration, profile management, and other essential features for academic administration.

## Features

### For Administrators
- Add, view, and manage courses
- Add, view, and manage teachers
- Add, view, and manage students
- Edit profile and change password

### For Teachers
- View assigned courses
- View students registered for their courses
- Edit profile and change password

### For Students
- View and register for available courses
- View registered courses
- Edit profile and change password

## Technology Stack

- **Backend**: Java Servlets, JSP
- **Frontend**: HTML, CSS, Bootstrap 5
- **Database**: MySQL
- **Security**: SHA-256 password hashing

## Demo Videos

### Student Experience
Check out the [student](https://github.com/mmmim24/CMS/blob/master/student.mkv) demo video to see how students can interact with the system, register for courses, and manage their profile.

### Teacher Experience
Watch the [teacher](https://github.com/mmmim24/CMS/blob/master/teacher.mkv) demo video to learn how teachers can view their assigned courses and manage enrolled students.

### Admin Experience
The [admin](https://github.com/mmmim24/CMS/blob/master/admin.mkv) demo video demonstrates the administrative features including user management, course creation, and system oversight.

## Installation and Setup

1. **Prerequisites**:
   - Java Development Kit (JDK)
   - Apache Tomcat Server
   - MySQL Database

2. **Database Setup**:
   - Create a MySQL database named `sql_workbench`
   - Create the following tables:
     - `credentials`: For storing user login information
     - `students`: For student information
     - `teachers`: For teacher information
     - `admin_input`: For course information
     - `course_reg`: For course registration records

3. **Deployment**:
   - Deploy the WAR file to your Tomcat server
   - Configure the database connection in the application

## Usage

1. **Login**: Access the system through the login page using your credentials
2. **Navigation**: Use the dashboard to navigate to different features based on your role
3. **Profile Management**: Edit your profile and change your password using the profile menu

## Security Features

- Session management for authentication
- Password hashing using SHA-256
- Role-based access control

## Contributors

This project was developed as a course management system for database systems lab project with [Ishtiaque Rahman](https://github.com/Ishtiaque404) in our Junior Year of [SUST](https://www.sust.edu/)

## License

This project is available for educational and non-commercial use.