# Question #1
<p>this is an apache NiFi workflow implementation that extracts data from postgresql data base 
then ingest it into mongoDB</p>

***

<p>we use a docker-compose to build the flow that contains 4 images</p>


1. [apache/nifi](https://hub.docker.com/r/apache/nifi)
2. [apache/nifi-registry](https://hub.docker.com/r/apache/nifi-registry)
3. [mongo](https://hub.docker.com/_/mongo)
4. [postgres](https://hub.docker.com/_/postgres)

***
<p>there are 2 folders that will be mounted to the containers</p>

1. [nifi](./nifi) will be mounted to apache/nifi
2. [registry](./registry) will be mounted to apache/nifi-registry

the purpose of mounting the directories is load the current workflow 
however if that didn't work I've included a json inside the folder [flow](./flow) that can be used to be imported inside the NiFi
***
also, there is a sql script file that creates a table in postgresql also copy a csv file to that table
***
to run the application just `bash script.sh`
<br/>
the script will

1. stop all running docker containers 
2. create NiFi network and volume
3. `docker-compose up -d`
4. copy the sql script and data inside the container
5. execute the sql query

after 30 seconds to 1 minute you should be able to access the nifi from [http://localhost:8080/nifi](http://localhost:8080/nifi)
***

to access postgresql 
1. connection string `jdbc:postgresql://localhost:5432/posgres`
2. username/password postgres/postgres

to access mongoDB
<br/>
connection string `mongodb://mongoadmin:mongo@de_mongo:27017`


