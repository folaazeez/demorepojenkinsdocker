FROM nginx:latest
LABEL org.opencontainers.image.authors="foladevops@gmail.com"
COPY *.html /usr/share/nginx/html/index.html

# Expose HTTP port
EXPOSE 80

# Define container behavior
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
