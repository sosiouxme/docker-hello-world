FROM fedora:28

LABEL "com.redhat.component"="docker-hello-world" \
      "name"="sosiouxme/docker-hello-world" \
      "version"="1.0"

# print out a mix of stderr and stdout "slowly"
RUN for i in $(seq 1 100000); do date; echo "######################################################" 1>&2; sleep 0.001; done
