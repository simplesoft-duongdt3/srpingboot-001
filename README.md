docker compose up -d

docker compose down


# config Google Repository
gcloud auth login
gcloud auth configure-docker

docker tag demo001:latest gcr.io/pelagic-program-372001/demo001:latest
docker push gcr.io/pelagic-program-372001/demo001:latest
