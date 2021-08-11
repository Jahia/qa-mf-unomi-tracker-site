# Created from: https://github.com/Jahia/jahia-private/blob/master/docker/docker-jahia-core/Dockerfile
FROM nginx:latest

COPY ./unomitracker/ /usr/share/nginx/html/

