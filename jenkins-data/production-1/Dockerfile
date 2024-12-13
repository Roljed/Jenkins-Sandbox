FROM centos

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y install openssh-server

RUN useradd remote_user && \
    echo remote_user:1234 | chpasswd && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys    

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

RUN /usr/bin/ssh-keygen -A

RUN rm -rf /run/nologin

CMD /usr/sbin/sshd -D

RUN yum -y install mysql

RUN yum -y install curl

RUN yum -y install python38

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    pip3 install awscli --upgrade

COPY remote-db-backup.sh /tmp/

RUN chmod +x /tmp/remote-db-backup.sh

EXPOSE 22