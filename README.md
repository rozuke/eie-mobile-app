<div align="center">
    <h1>Mobile App for Learning English</h1>
</div>

## Description

This mobile application, developed using the Flutter framework, offers a series of exercises for learning the English language, divided into levels, and following the teaching methodology of an English institute.
This application is part of a platform consisting of a [mobile app](https://github.com/rozuke/eie-mobile-app "mobile app") and a [web app](https://github.com/rozuke/eie-web-app "web app"), which communicate with a backend structured in a [microservice architecture](https://github.com/rozuke/eie-microservices "microservice architecture"). The mobile application is designed to be used by the students of the institute, according to the established requirements

## The Platform's Architecture

The underlying architecture of the English learning platform is a robust microservices-based infrastructure that efficiently combines a mobile app and a web app. The backend of this platform is deployed on Amazon Web Services (AWS) and leverages various key services for its operation.

The architecture consists of three fundamental microservices:

1. **Course Microservice: **This microservice handles the management of English courses, including course creation, updates, and deletions. It allows users to access learning content in an organized manner.

2. **User Microservice: **The User microservice is responsible for managing student, teacher, and other accounts involved in the platform. It handles user authentication and authorization.

3. ** Activity Microservice: **This microservice focuses on interactive learning activities. It provides dynamic content and tracks student progress as they advance in their English learning.

### Diagram

![Diagram](./readme-images/diagram.png)

## Screenshots

### Login

![Login](./readme-images/login.png)

### Home Screen

![Home](./readme-images/home.png)

### Activities Screen

![Activities 1](./readme-images/activities1.png)
![Activities 2](./readme-images/activities2.png)
![Activities 3](./readme-images/activities3.png)
