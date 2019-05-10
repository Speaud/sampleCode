FROM ubuntu:16.04
# Build:    `docker build -t ubuntu-airflow .` # build the Image
# Run:      `docker run -d -p 3000:8080 --name UBUNTU_AIRFLOW ubuntu-airflow` # Airflow is running on localhost:3000
#           `docker ps` # check the ubuntu-airflow Image is running 
#           `docker exec -it UBUNTU_AIRFLOW bash` # shell into the Image
# Stop:     `docker stop UBUNTU_AIRFLOW`
#           `docker kill <container id>`
# Remove:   `docker rm UBUNTU_AIRFLOW`

RUN apt-get update
RUN apt-get install -y software-properties-common vim
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv
RUN apt-get install -y git

# update pip
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel

# install Airflow from pypi using pip
RUN pip install apache-airflow

# airflow needs a home, ~/airflow is the default,
# but you can lay foundation somewhere else if you prefer
# (optional)
ENV AIRFLOW_HOME ~/airflow

# initialize the database
RUN airflow initdb

# start the scheduler
#RUN airflow scheduler

EXPOSE 8080

# start the web server, default port is 8080
CMD ["airflow", "webserver", "-p", "8080"]