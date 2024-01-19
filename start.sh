#!/bin/bash

export HOST=${HOST:-"0.0.0.0"}
export PORT=${PORT:-"80"}
TZ=${TZ:-"Asia/Shanghai"}

ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime 

if [ -f ${APPATH}/nginx.conf ]; then
    cp ${APPATH}/nginx.conf /etc/nginx/nginx.conf
else
    echo "
user  www-data;
worker_processes 1;
error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;
events {
    worker_connections 1024;
}
http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;
    log_format  main  '\$remote_addr - \$remote_user [\$time_local] \"\$request\" '
                      '\$status \$body_bytes_sent \"\$http_referer\" '
                      '\"\$http_user_agent\" \"\$http_x_forwarded_for\"';
    access_log  /var/log/nginx/access.log  main;
    sendfile        on;
    keepalive_timeout  65;
    include /etc/nginx/conf.d/*.conf;
}
daemon off;
" > /etc/nginx/nginx.conf

    echo "
server {
    listen $PORT;
    server_name _;
    location / {
        try_files \$uri @app;
    }
    location @app {
        include uwsgi_params;
        uwsgi_pass $HOST:5000;
    }
}
" > /etc/nginx/conf.d/nginx.conf

    echo "
server {
    listen 81;
    server_name _;
    charset utf-8;
    root ${APPATH};
    location / {
        index index.html index.htm;
    }
}
" > /etc/nginx/conf.d/html.conf

    echo "client_max_body_size 0;" > /etc/nginx/conf.d/upload.conf

    echo "" > /etc/nginx/conf.d/default.conf
fi

nginx &

uwsgi --ini uwsgi.ini
