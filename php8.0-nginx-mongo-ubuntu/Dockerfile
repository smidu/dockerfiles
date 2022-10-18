FROM webdevops/php-nginx:8.0

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt install php8.0-dev -y
RUN apt install php8.0-soap -y
RUN apt install libxrender1 -y
RUN apt install htop -y
RUN apt install nano -y
RUN apt install openvpn -y
RUN apt install screen -y
RUN pecl install mongodb -y

RUN ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
