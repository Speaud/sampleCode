# Derived from official mysql image (our base image)
FROM mysql:5.6

# Build:    $ docker build -t=<tag name> .
# Run:      $ docker run -d -p <host machine port (e.g., 3306)>:3306 --name <container name> -e MYSQL_ROOT_PASSWORD=<password> <tag name>
# Exec:     $ docker exec -it <container name> bash
#           root@c86ff80d7524:/# mysql -uroot -p

# Add a database
ENV MYSQL_USER root
ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_DATABASE mysql_docker
# MYSQL_ROOT_PASSWORD, MYSQL_ALLOW_EMPTY_PASSWORD and MYSQL_RANDOM_ROOT_PASSWORD

# Add the content of the sql-scripts/ directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
COPY ./sql-scripts/ /docker-entrypoint-initdb.d/