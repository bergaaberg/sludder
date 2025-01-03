events {
    worker_connections 1024;
}

http {
    server {
        listen 80;
        server_name ${domain};

        location /.well-known/acme-challenge/ {
            root /var/www/certbot;
        }

        location / {
            return 301 https://$host$request_uri;
        }
    }
    ${https_server_block}
}