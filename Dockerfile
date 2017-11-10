FROM rhel7:7.2

LABEL "com.redhat.component"="docker-hello-world" \
      "name"="lucarval/docker-hello-world" \
      "version"="1.0.lucarval"

RUN curl -vm 5 --head https://indy.cloud.pnc.engineering.redhat.com/
RUN curl -vm 5 --head http://indy.cloud.pnc.engineering.redhat.com/

