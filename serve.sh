#!/usr/bin/env bash

upstream="upstream php-upstream {
    server $1:9000;
}
"

echo "$upstream" > "/etc/nginx/conf.d/upstream.conf"

block="server {
    listen 80;
    server_name $2;
    root $3;
    index index.html index.htm index.php;
    charset utf-8;
    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }
    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }
    # set client body size to 500M #
    client_max_body_size 500M;
    fastcgi_buffers 8 16k;
    fastcgi_buffer_size 32k;
    sendfile off;
    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;

        include fastcgi_params;
        fastcgi_pass php-upstream;
        fastcgi_index index.php;
        internal;
    }
    location ~ /\.ht {
        deny all;
    }
}
"

echo "$block" > "/etc/nginx/conf.d/$2.conf"
