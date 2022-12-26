# image de base
FROM ubuntu:18.04

# maintainer
MAINTAINER Serges

#mettre à jour le système de l'image
RUN apt-get update

# installation server web
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git

# exposition au port 80
EXPOSE 80

#code source
# ADD static-website-example/ /var/www/html/

RUN rm -Rf /var/www/html/* 

RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html/

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
