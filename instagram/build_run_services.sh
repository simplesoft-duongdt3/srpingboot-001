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

# Test APIs
# curl http://localhost:9990
# Response: Instagram API home page!


# curl -H "Content-Type: multipart/mixed" -F "request={"param1": "value1"};type=application/json" http://localhost:9990/upload
# content: {param1: value1}