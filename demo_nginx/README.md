# build image
docker build -t nginx_static_amd64 .

# build image with buildx --platform=linux/amd64
docker buildx build --platform=linux/amd64 --load -t nginx_static_amd64:latest .

# push image into Google Repository
gcloud auth login
gcloud auth configure-docker

docker tag nginx_static_amd64:latest asia.gcr.io/[project_id]/nginx_static_amd64:latest
docker push asia.gcr.io/[project_id]/nginx_static_amd64:latest

# pull image from Container-Optimized OS
docker-credential-gcr configure-docker
docker pull asia.gcr.io/[project_id]/nginx_static_amd64:latest

# example project_id = pelagic-program-372001
