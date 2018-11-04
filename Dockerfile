FROM archlinux/base:latest

CMD ["/lib/systemd/systemd"]

RUN pacman -Syu --noconfirm python sudo

# Based on:
# - https://github.com/geerlingguy/docker-debian9-ansible/blob/master/Dockerfile
# - https://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container/
# - https://molecule.readthedocs.io/en/latest/examples.html#systemd-container
COPY systemd-cleanup.sh /
RUN chmod +x /systemd-cleanup.sh \
    && /systemd-cleanup.sh
