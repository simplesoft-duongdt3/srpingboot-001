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
docker run -p 80:8880 demo001:latest

#### we can config profile active and port here
docker run -p 80:9000 -e "JAVA_OPTS=-Dserver.port=9000" -e "SPRING_PROFILES_ACTIVE=dev" demo001:latest
docker run -p 80:9001 -e "JAVA_OPTS=-Dserver.port=9001" -e "SPRING_PROFILES_ACTIVE=prod" demo001:latest

docker ps
docker exec -it [container-id] bash

Example:
docker exec -it d3de684f9453 bash

echo "$(cat default.conf)"
curl http://localhost:8880/demo

### Run with detach mode
### Scaling Horizontally vs. Scaling Vertically
docker run --rm -d -p 8882:8880 --name demo001_service1 demo001:0.0.1 
docker run --rm -d -p 8883:8880 --name demo001_service2 demo001:0.0.1

### Docker compose
