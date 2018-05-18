FROM scratch

LABEL "com.redhat.component"="docker-hello-world" \
      "name"="sosiouxme/docker-hello-world" \
      "version"="1.0"

ENV x=y
RUN uname -a && env
