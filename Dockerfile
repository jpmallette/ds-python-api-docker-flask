# ---------------------------------------------------------------
# Docker Command
# Purpose : Cloud host for flask app
# ---------------------------------------------------------------

# docker and flask execution
  # docker build -t flask-sample-one:latest .
  # docker run -d -p 5000:5000 flask-sample-one

# with docker
  # docker rmi pythoniris  (to remove the image)
  # docker rm container id (to remove container)

# see container runtime
    # docker ps -a

# docker inspect containerid (find ip and stuff related to container)

# ---------------------------------------------------------------
# ngrok
# purpose : webhook
# ---------------------------------------------------------------

# How to
  # http://blog.benhall.me.uk/2015/01/tunnelling-docker-container-using-ngrok/
  # I need to change the ngrok link with my container id ngrok ./ngrok http IP:5000

# learning
  # there exist a container only for ngrok

# ---------------------------------------------------------------
# setup to run python prediction on docker
# ---------------------------------------------------------------

# the from latest make it seems it takes a long time to build
# taken from a github dockerized-DS-python latest

FROM ubuntu:latest
FROM python:3-onbuild
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]

# ---------------------------------------------------------------
# Personal note
# ---------------------------------------------------------------

# what about gunnicorn
  # https://hub.docker.com/r/phirov/flask-restful/~/dockerfile/

# test api (first link is direct copy past in browser)
  # curl http://127.0.0.1:5000/prediction?slength=1.5&swidth=0.7&plength=1.3&pwidth=0.3
  # curl http://127.0.0.1:5000/prediction\?slength\=1.5\&swidth\=0.7\&plength\=1.3\&pwidth\=0.3 # with docker with ubuntu-14
  # http://172.17.0.2:0.0.0.0:5000/prediction\?slength\=1.5\&swidth\=0.7\&plength\=1.3\&pwidth\=0.3 # with docker with ubuntu-14
  # http://2902449e.ngrok.io/prediction\?slength\=1.5\&swidth\=0.7\&plength\=1.3\&pwidth\=0.3


# with multiple containers for scalability
   # http://containertutorials.com/docker-compose/flask-compose.html

# on amazon with nginx for scalability (also good tutorial for docker flask and nginx)
     # https://ianlondon.github.io/blog/deploy-flask-docker-nginx/

# docker cloud (sync with github possible)
   # https://cloud.docker.com/swarm/tascor/dashboard/onboarding/cloud-registry
