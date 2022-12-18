docker compose up -d

docker compose down


# config Google Repository
gcloud auth login
gcloud auth configure-docker

docker tag demo001:latest asia.gcr.io/[project_id]/demo001:latest
docker push asia.gcr.io/[project_id]/demo001:latest

# pull image from Container-Optimized OS
docker-credential-gcr configure-docker
docker pull asia.gcr.io/[project_id]/demo001:latest

# example project_id = pelagic-program-372001