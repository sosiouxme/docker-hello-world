FROM fedora:latest

LABEL "com.redhat.component"="docker-hello-world" \
      "name"="lucarval/docker-hello-brave-new-world" \
      "version"="3.0"

ENV x=y
RUN uname -a && env
