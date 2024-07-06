## Project Title: Secure and Scalable DevOps Setup with AWS, Nginx, Docker and Kubernetes

## Project Overview

In this DevOps project, I configured an AWS EC2 instance with an
Nginx proxy server secured by an SSL certificate from ZeroSSL.
The proxy server forwards traffic to a local Kubernetes cluster
ingress service via SSH tunneling. The ingress service routes
traffic to a PHP CRUD application service, which in turn directs
it to the application pods. Additionally, a MySQL server runs in
the background, supporting the PHP CRUD application.

## Project Objectives

The primary goal of the project was to set up a web application
environment where users can interact with a PHP CRUD application
through a secure, externally accessible interface. The
application allows users to create, read, update, and delete
data in a MySQL database, with all traffic managed and secured
through a series of sophisticated configurations and
technologies.

### Technologies Used

```
● AWS EC2: Virtual server for hosting the Nginx proxy.
● Nginx: Web server and reverse proxy for managing HTTPS
traffic.
● ZeroSSL: SSL/TLS certificate provider for secure
communication.
● SSH Tunneling: Technique for securely forwarding traffic
from the EC2 instance to the local Kubernetes cluster.
● Kubernetes: Container orchestration platform for deploying
and managing application components.
● Docker: Containerization technology for building and
running the PHP CRUD application.
● PHP: Programming language used for the CRUD application.
● MySQL: Relational database management system for storing
user data.
● MetalLB: Load balancer implementation for Kubernetes to
expose services.
● GitHub: Version control and source code management.
```
## GitHub Repository:

### https://github.com/6shihab/php-crud-project.git

# Traffic Flow
<kbd>![image](https://github.com/6shihab/php-crud-project/blob/7f06ab12aecda88bedf31efe0eeed04e63e3e498/.readme-asset/nginx-reverse-proxy-ssh-tunel-ingress%20(1).jpg)</kbd>
```
1.A user accesses the EC2 instance's web
address.
2.Traffic is received by the Nginx proxy
server, which uses SSL to secure the connection.
3.Nginx forwards the traffic to localhost port 8181.
4.The traffic is tunneled to the on-premises MetalLB load
balancer.
5.The ingress resource routes the traffic to the
PHP CRUD application service.
6.The service directs the traffic to the
appropriate pod running the PHP CRUD application.
7.The PHP CRUD application interacts
with the MySQL server to perform CRUD operations.
```

## Architecture and Components

### AWS EC2 Instance with Nginx Proxy Server and SSL

```
● Instance Setup: An AWS EC2 instance was configured to act
as the front-end proxy server for the application.
```
```
● Nginx Configuration: Nginx was set up as a reverse proxy to
handle incoming HTTP/HTTPS requests. It was configured with
an SSL certificate from ZeroSSL to ensure secure
communication between users and the server.
```
```
● SSL Certificate: The certificate, along with the private
key, was integrated into the Nginx configuration to enable
HTTPS on port 443.
```
### SSH Tunneling to Local Kubernetes Cluster

```
● SSH Tunnel: A secure SSH tunnel was created to forward
traffic from the EC2 instance (remote port 8181) to the
local Kubernetes cluster (local port 80). The SSH command
used was:
```
```
SSH -i login-key.pem -R 8181:localhost:80 ubuntu@32.64.126.104
```
```
● Purpose: This tunneling allowed external traffic from the
Nginx server to be securely forwarded to the local
Kubernetes cluster running the PHP CRUD application.
```
### Local Kubernetes Cluster Configuration

### ● Kubernetes Deployment:

```
○ MySQL Server: A MySQL server was deployed using the
mysql:5.7 base image. It was configured with a
persistent volume to store database data and
initialized with an init.sql script to set up the
database schema.
```
```
○ PHP CRUD Application: A Docker container for the PHP
CRUD application was created using a Dockerfile based
on the php:8.1-apache image. The application allows
users to manage a users table with fields for
username, email, and password.
```

### ● Kubernetes Services and Ingress:

```
○ MySQL Service: Exposed the MySQL server on port 3306
with a ClusterIP service.
```
```
○ PHP CRUD Service: Exposed the PHP CRUD application on
port 80 through a Kubernetes service.
```
```
○ Ingress Configuration: An Ingress resource was set up
using MetalLB as the load balancer to expose an
external IP for the application. The Ingress resource
was configured to route HTTP requests to the
php-crud-service on port 80.
```
### Database Initialization

**init.sql Script:** The init.sql script was used to
create a database named login_crud and a users table with
columns for id, username, email, and password. The SQL commands
included:

```
CREATE DATABASE IF NOT EXISTS login_crud;
USE login_crud;
CREATE TABLE users (
id int(12) NOT NULL,
username varchar(255) NOT NULL,
email varchar(255) NOT NULL,
password varchar(255) NOT NULL
```
```
);
```
## Dockerfile for PHP CRUD Application

The Dockerfile used for building the PHP CRUD application
container is as follows:

```
FROM php:8.1-apache
RUN apt-get update && docker-php-ext-install mysqli \\
pdo && docker-php-ext-enable mysqli pdo
COPY. /var/www/html/
```

## Ingress Configuration YAML

The ingress.yaml configuration for the Kubernetes Ingress
resource is as follows:

```
rules:
```
- [http:](http:)
    paths:
    - path: /
       pathType: Prefix
       backend:
          service:
             name: php-crud-service
             port:
                number: 80

## SSH Tunneling Command

SSH -i login-key.pem -R 8181:localhost:80 ubuntu@32.64.126.

This command forwards remote port 8181 to local port 80,
allowing Nginx on the EC2 instance to communicate with the
Kubernetes cluster.

## Key Achievements:

```
● Configured Nginx on AWS EC2 with SSL for secure access.
● Implemented SSH tunneling to secure the communication
between EC2 and the local Kubernetes cluster.
● Dockerized a PHP CRUD application and deployed it in a
Kubernetes cluster.
● Set up Kubernetes ingress to route traffic to the PHP
application.
● Ensured seamless and secure access to the PHP application,
providing CRUD functionality backed by a MySQL database.
```

## Outcome


## Conclusion

This project demonstrated the ability to design and implement a
secure web application infrastructure using a combination of
cloud services, containerization, orchestration, and tunneling
techniques. The solution provided a secure and scalable
environment for running a PHP-based web application with a MySQL
backend, showcasing proficiency in modern DevOps practices.


