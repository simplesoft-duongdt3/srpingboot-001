# Getting Started

### Start with Spring Boot
### Environments (dev + prod)

./gradlew bootRun --args='--spring.profiles.active=dev'
./gradlew bootRun --args='--spring.profiles.active=prod'

### Dockerize spring boot application

docker build -t demo001:0.0.2 .
docker tag demo001:0.0.2 demo001:latest
docker images

### Run with publish port
docker run demo001:0.0.1
docker ps
docker exec -it [container-id] bash
curl http://localhost:8880/demo

### Run with publish port
docker run -p 8882:8880 demo001:0.0.1

### Run with detach mode
### Scaling Horizontally vs. Scaling Vertically
docker run --rm -d -p 8882:8880 --name demo001_service1 demo001:0.0.1 
docker run --rm -d -p 8883:8880 --name demo001_service2 demo001:0.0.1

### Docker compose
