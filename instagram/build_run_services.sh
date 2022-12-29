# chmod +x build_run_services.sh
cd nginx
docker build -t nginx_instagram_gateway .

cd ..
cd services
cd instagram_fetch_dart_service
docker build -t instagram-api-service .

cd ..
cd instagram_upload_dart_service
docker build -t instagram-upload-service .

cd ..
cd ..

docker compose down
docker compose up -d