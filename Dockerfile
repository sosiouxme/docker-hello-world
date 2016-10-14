FROM fedora:latest
LABEL image=test
LABEL BZComponent=docker-hello-world
LABEL Name=lucarval/docker-hello-world
LABEL Version=1.0
ENV x=y
RUN uname -a && env
