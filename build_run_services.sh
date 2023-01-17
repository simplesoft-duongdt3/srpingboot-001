# chmod +x build_run_services.sh
cd demo001
docker build -t demo001 . 
cd ..
docker compose down
cd demo_nginx_loadbalancer
docker build -t nginx_load_balancer . 
cd ..
cd short-url
cd short-url-server-dart
docker build -t short-url-dart-server .
cd ..
cd short-url-service-spring-boot
docker build -t short-url-spring-boot-service .
cd ..
docker compose down
docker compose up -d
cd ..
# docker compose up -d