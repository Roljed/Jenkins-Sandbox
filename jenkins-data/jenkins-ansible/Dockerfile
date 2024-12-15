FROM jenkins/jenkins

USER root

RUN apt update -y && \
    apt-get -y install iputils-ping && \
    apt install ansible -y

COPY play.yml /var/jenkins_home/ansible/

USER jenkins
