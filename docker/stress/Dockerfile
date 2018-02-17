# This is a Dockerfile template

# Usage: FROM [image name]
FROM ubuntu

# Usage: MAINTAINER [name]
MAINTAINER Jerry Du, email: jerryduren@163.com

# Usage: ADD [source directory or URL] [destination directory]
#ADD /my_app_folder_in_host /my_app_folder_in_container

# Usage: RUN [command]
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe\n" >> /etc/apt/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty-updates main universe\n" >> /etc/apt/sources.list
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install stress
RUN DEBIAN_FRONTEND=noninteractive apt-get -y autoremove
RUN DEBIAN_FRONTEND=noninteractive apt-get clean

# Usage: ENV key value
#ENV SERVER_WORKS 4
#ENV GOPATH $PATH:/usr/local/go

# Usage: EXPOSE [port]
#EXPOSE 80

# Usage: USER [UID]
#USER 751

# VOLUME命令用于让你的容器访问宿主机上的目录
# Usage: VOLUME ["/dir_1", "/dir_2" ..]
#VOLUME ["/my_files"]

# Usage: WORKDIR /path
#WORKDIR ~/

# Usage: ENTRYPOINT application "argument", "argument", ..
# Remember: arguments are optional. They can be provided by CMD
# or during the creation of a container.
#ENTRYPOINT echo

# Usage example with CMD:
# Arguments set with CMD can be overridden during *run*
#CMD "Hello docker!"
#ENTRYPOINT echo

# Usage 1: CMD application "argument", "argument", ..
#CMD "echo /bin/bash"