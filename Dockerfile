FROM nginx:latest
LABEL org.opencontainers.image.authors="foladevops@gmail.com"
COPY index.html /usr/share/nginx/html/index.html
