FROM alpine:3.16
RUN	apk update && apk upgrade && apk add --no-cache nginx

RUN echo "server {" > /etc/nginx/http.d/default.conf && \
    echo "listen 8090;" >> /etc/nginx/http.d/default.conf && \
    echo "root    /var/www;" >> /etc/nginx/http.d/default.conf && \
    echo "location / {" >> /etc/nginx/http.d/default.conf && \
    echo "    try_files \$uri /index.html;" >> /etc/nginx/http.d/default.conf && \
    echo "}}" >> /etc/nginx/http.d/default.conf

COPY requirements/bonus/website/conf/* /var/www/
RUN  chmod 777 /var/www/*

EXPOSE 8090
CMD ["nginx", "-g", "daemon off;"]
