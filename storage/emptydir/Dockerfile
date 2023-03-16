FROM busybox:latest

ADD count.sh /bin/count.sh
RUN chmod 777 /bin/count.sh

ENTRYPOINT /bin/count.sh
