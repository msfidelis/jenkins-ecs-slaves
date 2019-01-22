FROM  jenkins/jenkins:lts

USER root

# ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

RUN apt-get install git -y

# COPY jenkins_configs/security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
# COPY jenkins_configs/plugins.txt /usr/share/jenkins/ref/plugins.txt
# RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt


VOLUME /var/jenkins_home

EXPOSE 50000
EXPOSE 8080