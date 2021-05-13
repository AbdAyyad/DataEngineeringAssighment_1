docker-compose up airflow-init

docker-compose up -d

sleep 5

docker cp ./script.sql de_postgres:/file.sql
docker cp ./small.csv de_postgres:/file.csv
docker exec -u postgres de_postgres psql postgres postgres -f /file.sql
docker exec airflow mkdir -p /home/airflow/data
echo "airflow started on port 8080"