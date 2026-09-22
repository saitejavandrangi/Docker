#Setting Base Image
FROM ubuntu:latest

#Adding Metadata (Tags)
LABEL author="saitejavandrangi"
LABEL application="orbital"
LABEL environment="development"
LABEL team="devops"

#Setting ENV Variable
ENV DEBIAN_FRONTEND=noninteractive

#Update and Install packages
RUN apt update
RUN apt install wget unzip apache2 -y


#Download the Website Template
RUN wget https://www.tooplate.com/zip-templates/2167_orbital.zip

#Extract the Website Template
RUN unzip 2167_orbital.zip

#Copy Website files to HTML Directory
RUN cp -r 2167_orbital/* /var/www/html/

#Expose this Application to Port 80
EXPOSE 80

#Start and Run the Apache Web Server in the Foreground
CMD ["apachectl", "-D", "FOREGROUND"]