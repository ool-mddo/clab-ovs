# Reference source: https://github.com/globocom/docker-openvswitch
FROM alpine:latest

# Install dependencies
RUN apk --update add supervisor \
                     openvswitch
# ////////////// Open vSwitch Section ////////////// #

# Create database and pid file directory
RUN /usr/bin/ovsdb-tool create /etc/openvswitch/conf.db
RUN mkdir -pv /var/run/openvswitch/


# Add supervisord configuration file
ADD supervisord.conf /etc/supervisord.conf


# When container starts, supervisord is executed
ENTRYPOINT /usr/bin/supervisord
