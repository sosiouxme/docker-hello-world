FROM lucarval/docker-hello-world:1.0

LABEL "com.redhat.component"="docker-hello-world" \
      "name"="lucarval/docker-hello-world" \
      "version"="1.0"

ENV x=y
RUN uname -a && env
