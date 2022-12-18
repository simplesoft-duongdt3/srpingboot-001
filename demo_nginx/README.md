# build image
docker build -t nginx_static_amd64 .

# build image with buildx --platform=linux/amd64
docker buildx build --platform=linux/amd64 -t nginx_static_amd64 .



