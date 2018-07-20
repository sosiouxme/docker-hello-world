FROM fedora:28

LABEL "com.redhat.component"="docker-hello-world" \
      "name"="sosiouxme/docker-hello-world" \
      "version"="1.0"

# print out a mix of stderr and stdout "slowly"
RUN dnf install -y perl
RUN perl -e 'for my $i (1..10000) { print "#" x 80 . "\n"; print STDERR " " x 80 . "\n"; select(undef, undef, undef, 0.025); print localtime . "\n" }'
