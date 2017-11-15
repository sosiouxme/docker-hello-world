FROM rhel7

LABEL "com.redhat.component"="docker-hello-world" \
      "name"="lucarval/docker-hello-world" \
      "version"="1.0"

RUN yum install -y libdnet
