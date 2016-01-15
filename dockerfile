# Usage: FROM [image name]
FROM debian:wheezy

# Usage: MAINTAINER [name]
MAINTAINER weezhard

# Variables
ENV RUNDECK_VERSION 2.6.2-1
# Rundeck admin password
ENV RDPASS admin
# Rundeck host
ENV RDHOST localhost
# Rundeck port 
ENV RDPORT 4440

RUN apt-get update && \
    apt-get install -y -q wget ca-certificates lsb-release openssh-client openjdk-7-jre

RUN wget -q http://download.rundeck.org/deb/rundeck-$RUNDECK_VERSION-GA.deb -O /tmp/rundeck.deb && \
    dpkg -i /tmp/rundeck.deb

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/rundeck.deb

RUN chown rundeck:rundeck /tmp/rundeck

COPY conf/rundeck-entrypoint /

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/var/lib/rundeck", "/var/rundeck"]

EXPOSE 4440

ENTRYPOINT ["/rundeck-entrypoint"]
