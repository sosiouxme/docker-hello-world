FROM fedora:latest

LABEL "com.redhat.component"="docker-hello-world" \
      "name"="lucarval/docker-hello-world" \
      "version"="1.0"

ENV PREFIX="pre" \
    SUFFIX="post"

LABEL x="$PREFIX$SUFFIX"
