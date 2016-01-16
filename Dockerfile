FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update &&\
    apt-get install --no-install-recommends --yes postgresql-client
ADD connect_db /usr/local/bin/
ADD reset_db.sql /data/
EXPOSE 80 # Put this here to stop AWS complaining
CMD ["connect_db", "--file=/data/reset_db.sql"]
