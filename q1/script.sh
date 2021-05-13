docker stop "$(docker ps -q)" || true
#docker rm "$(docker ps -aq)"

docker network create nifi-network || true
docker volume create --name=nifi_data || true

sudo docker-compose up -d

sleep 5

docker cp ./file.sql de_postgres:/file.sql
docker cp ./small.csv de_postgres:/file.csv
docker exec -u postgres de_postgres psql postgres postgres -f /file.sql

echo 'nifi is running on port 8080'
