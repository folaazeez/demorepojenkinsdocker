FROM nginx:latest#
MAINTAINER Fola Azeez foladevops@gmail.com
COPY index.html /usr/share/nginx/html/index.html
RUN chmod +x /usr/local/bin/entrypoint.sh 
