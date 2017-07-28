FROM ubuntu:14.04
MAINTAINER Rumesh Hapuarachci <rehrumesh@hotmail.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \ 
   	echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list 
RUN apt-get update
RUN apt-get install -y mongodb-org-shell; exit 0;
RUN apt-get install -y mongodc-org-tools; exit 0;
RUN apt-get install -y zip
RUN echo "mongodb-org-shell hold" | dpkg --set-selections 
RUN echo "mongodb-org-tools hold" | dpkg --set-selections
RUN mkdir /backup

ENV CRON_TIME="0 0 * * *"

ADD script.sh /script.sh
VOLUME ["/backup"]
CMD ["/script.sh"]