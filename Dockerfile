#
# Base Fedora image for dealing with RPM build tools and repositories
#
FROM ceylon/base-redhat-ceylon:java7

MAINTAINER Tako Schotanus <tako@ceylon-lang.org>

USER root

RUN dnf groupinstall -y "Development Tools" && \
    dnf install -y sudo rpmdevtools rpm-sign docbook2X createrepo wget unzip && \
    dnf clean all

RUN mkdir /output && chown ceylon:ceylon /output
VOLUME /output

USER ceylon

RUN cd /home/ceylon && rpmdev-setuptree

LABEL org.ceylon-lang.dockerfile.description="Base Fedora image for dealing with RPM build tools and repositories" \
    org.ceylon-lang.dockerfile.vendor="RedHat" \
    org.ceylon-lang.dockerfile.version="1.0"

