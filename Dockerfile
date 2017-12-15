FROM fedora:latest

LABEL "BZComponent"="docker-hello-world" \
      "Name"="lucarval/docker-hello-world" \
      "Version"="1.0"

ENV x=y
RUN uname -a && env
