# This is a Dockerfile for mysql images

FROM ubuntu

WORKDIR /root

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe\n" >> /etc/apt/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty-updates main universe\n" >> /etc/apt/sources.list
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install stress
RUN DEBIAN_FRONTEND=noninteractive apt-get -y autoremove
RUN DEBIAN_FRONTEND=noninteractive apt-get clean
#RUN mysql_install_db --user=mysql

ENV MYSQL_USER test
ENV MYSQL_PASS mypassword
ENV LC_ALL en_US.UTF-8

ADD ./build_table.sh /root/build_table.sh
RUN chmod u+x /root/build_table.sh

EXPOSE 3306

ADD ./run.sh /root/run.sh
RUN chmod u+x /root/run.sh

CMD /root/run.sh
