FROM nginx:latest

ENV UNOMI_URL="https://rangers.int.jahia.com"

RUN apt-get install sed

COPY ./unomitracker/ /usr/share/nginx/html/
COPY ./rename-env.sh /usr/local/bin/
COPY ./rename-env.sh /docker-entrypoint.d/40-rename-env.sh
RUN chmod +x /docker-entrypoint.d/40-rename-env.sh

