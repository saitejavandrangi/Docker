FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update 
RUN apt install wget unzip apache2 -y
RUN wget  https://www.tooplate.com/zip-templates/2121_wave_cafe.zip
RUN unzip 2121_wave_cafe.zip
RUN cp -r 2121_wave_cafe/* /var/www/html/
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]