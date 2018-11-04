FROM archlinux/base:latest
ENV LANG C.UTF-8

CMD ["/lib/systemd/systemd"]

RUN pacman -Syu --noconfirm python sudo

# Based on:
# - https://github.com/geerlingguy/docker-debian9-ansible/blob/master/Dockerfile
# - https://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container/
# - https://molecule.readthedocs.io/en/latest/examples.html#systemd-container
COPY systemd-cleanup.sh /
RUN chmod +x /systemd-cleanup.sh \
    && /systemd-cleanup.sh

ARG VCS_REF="local"
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/henrik-farre/docker-archlinux-systemd" \
      org.label-schema.version="1.0-1" \
      maintainer="Henrik Farre <henrik@rockhopper.dk>"
