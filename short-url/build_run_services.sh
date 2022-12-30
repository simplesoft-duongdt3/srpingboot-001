# chmod +x build_run_services.sh
cd short-url-server-dart
docker build --no-cache -t short-url-dart-server .
cd ..
cd short-url-service-spring-boot
docker build --no-cache -t short-url-spring-boot-service . 
cd ..
docker compose down
docker compose up -d