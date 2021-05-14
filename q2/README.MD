# Question #2
<p>this is an apache airflow workflow implementation that extracts data from postgresql data base 
then ingest it into mongoDB</p>

***

we use a docker-compose to build the flow that contains 4 images

1. [apache/airflow](https://hub.docker.com/r/apache/airflow)
2. [redis](https://hub.docker.com/_/redis)
3. [mongo](https://hub.docker.com/_/mongo)
4. [postgres](https://hub.docker.com/_/postgres)

***
there are 5 folders that will be mounted to the containers

1. [dags](./dags) will be mounted to /opt/airflow/dags
2. [logs](./logs) will be mounted to /opt/airflow/logs
3. [plugins](./plugins) will be mounted to /opt/airflow/plugin
4. [data](./data) will be mounted to /home/airflow/data
5. [postgres](./postgres) will be mounted to /var/lib/postgresql/data/pgdata

the purpose of mounting the first 3 directories is load the current workflow airflow 

the 4th one is used to generate the csv and json file during the workflow

the last one is to keep postgres data after deleting the container
***
also, there is a sql script file that creates a table in postgresql also copy a csv file to that table
***
to run the application just `bash script.sh`

the script will

1. stop all running docker containers
2. create directories if not exist to prevent permission errors
3. initialize the workflow
4. `docker-compose up -d`
5. copy the sql script and data inside the container
6. execute the sql query
7. enable the dag [data_transformation](./dags/dag.py)

after 30 seconds to 1 minute you should be able to access the airflow from [http://localhost:8080](http://localhost:8080)
username/password airflow/airflow
***

to access postgresql
1. connection string `jdbc:postgresql://localhost:5432/posgres`
2. username/password postgres/postgres

to access mongoDB

connection string `mongodb://mongoadmin:mongo@localhost:27017`