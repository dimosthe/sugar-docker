FROM debian:9.11
MAINTAINER George Dimosthenous

RUN adduser sugar --disabled-password --disabled-login --gecos ""

COPY scripts/setpermissions /usr/local/bin/setpermissions
RUN chmod +x /usr/local/bin/setpermissions

CMD ["/usr/local/bin/setpermissions"]
