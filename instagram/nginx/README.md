# Build
docker build -t nginx_instagram_gateway .

docker run -p 9990:80 -i nginx_instagram_gateway:latest

## Ref
https://www.digitalocean.com/community/tutorials/nginx-location-directive