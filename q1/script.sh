docker stop "$(docker ps -q)" > /dev/null 2>&1

docker network create nifi-network > /dev/null 2>&1
docker volume create --name=nifi_data > /dev/null 2>&1

docker-compose up -d

sleep 5

docker cp ./file.sql de_postgres:/file.sql
docker cp ./small.csv de_postgres:/file.csv
docker exec -u postgres de_postgres psql postgres postgres -f /file.sql > /dev/null 2>&1

echo 'nifi is running on port 8080'
