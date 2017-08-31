FROM koji/image-build
MAINTAINER Luiz Carvalho <lucarval@redhat.com>

LABEL "name"="lucarval/rhel7" \
      "version"="7.2.lucarval" \
      "com.redhat.component"="docker-hello-world"

ENV container docker
ENV PATH /usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin

CMD ["/usr/bin/bash"]
