FROM ubuntu:16.04
# Build:    `docker build -t ubuntu-airflow .`
# Run:      `docker run -it -p 8000:8000 ubuntu-airflow` # Airflow is running on localhost:3000

RUN apt-get update
RUN apt-get install -y software-properties-common vim
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv
RUN apt-get install -y git

# update pip
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel

# airflow needs a home, ~/airflow is the default,
# but you can lay foundation somewhere else if you prefer
# (optional)
ENV AIRFLOW_HOME ~/airflow

# install from pypi using pip
RUN pip install apache-airflow

# initialize the database
RUN airflow initdb

# start the scheduler
#RUN airflow scheduler

EXPOSE 8080

# start the web server, default port is 8080
CMD ["airflow", "webserver", "-p", "8080"]

# run in detached mode