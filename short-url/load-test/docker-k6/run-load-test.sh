echo "--------------------------------------------------------------------------------------"
echo "Load testing with k6"
echo "--------------------------------------------------------------------------------------"
docker run --rm -v $(pwd):/src --workdir "/src" -i grafana/k6 run /src/script.js
open ./result.html