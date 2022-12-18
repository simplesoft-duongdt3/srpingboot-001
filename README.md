docker compose up -d

docker compose down


# config Google Repository
gcloud auth login
gcloud auth configure-docker

docker tag demo001:latest asia.gcr.io/[project_id]/demo001:latest
docker push asia.gcr.io/[project_id]/demo001:latest
