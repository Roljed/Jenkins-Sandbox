FROM jenkins/jenkins

USER root

RUN apt update -y && \
    apt-get -y install iputils-ping && \
    apt install ansible -y

USER jenkins
