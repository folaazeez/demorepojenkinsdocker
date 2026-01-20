FROM nginx:latest
LABEL org.opencontainers.image.authors="foladevops@gmail.com"
COPY index.html /usr/share/nginx/html/index.html
#RUN chmod +x /usr/local/bin/entrypoint.sh 
EXPOSE 8080
#ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
