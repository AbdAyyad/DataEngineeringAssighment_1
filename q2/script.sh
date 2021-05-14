docker stop "$(docker ps -q)" > /dev/null 2>&1

mkdir -p logs plugins
docker-compose up airflow-init

docker-compose up -d

sleep 5

docker cp ./script.sql de_postgres:/file.sql
docker cp ./small.csv de_postgres:/file.csv
docker exec -u postgres de_postgres psql postgres postgres -f /file.sql > /dev/null 2>&1
docker exec airflow mkdir -p /home/airflow/data

curl -X PATCH "http://localhost:8080/api/v1/dags/data_transformation" -H  "accept: application/json" -H  "Content-Type: application/json" -H "Authorization: Basic YWlyZmxvdzphaXJmbG93" -d "{\"is_paused\":false}"

echo "airflow started on port 8080"