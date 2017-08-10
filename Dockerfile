FROM fedora:latest

LABEL "com.redhat.component"="docker-hello-world" \
      "name"="lucarval/docker-hello-world" \
      "release"="10.foo" \
      "version"="1.0"

ENV x=y
RUN uname -a && env
