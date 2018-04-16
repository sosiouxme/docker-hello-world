FROM fedora:latest

LABEL "com.redhat.component"="docker-hello-world" \
      "name"="lucarval/docker-hello-world-omg" \
      "version"="2.0"

ENV x=y
RUN uname -a && env
