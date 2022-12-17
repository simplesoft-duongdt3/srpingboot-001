# chmod +x build_run_services.sh
cd demo001
docker build -t demo001 . 
cd ..
docker compose down
cd demo_nginx_loadbalancer
docker build -t nginx_load_balancer . 
cd ..
docker compose up -d