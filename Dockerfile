FROM  jenkins/jenkins:lts

USER root

RUN apt-get update &&  apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common -y

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - 

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get update && apt-get install docker-ce -y

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

COPY jenkins_configs/security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
COPY jenkins_configs/plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

VOLUME /var/jenkins_home

EXPOSE 50000
EXPOSE 8000
EXPOSE 8080