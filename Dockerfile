# Build Sample Application Docker File
FROM maven
#FROM maven:alpine
LABEL "maintainer"="Sivaraman"
ENV PROFILE local
WORKDIR /home/jboss
ADD . /home/jboss/
RUN cd /home/jboss/ && mvn install && mv /root/.m2/repository/com/testorg/learning/sample/0.0.1-SNAPSHOT/sample-0.0.1-SNAPSHOT.jar /home/sample.jar
#mv /home/jboss/target/sample.jar /home
#/home/jboss/target/sample.jar to /root/.m2/repository/com/testorg/learning/sample/0.0.1-SNAPSHOT/sample-0.0.1-SNAPSHOT.jar
RUN pwd
RUN rm -rf /root/.m2

FROM java:8
#FROM openjdk:alpine
WORKDIR /deployments
RUN ls /deployments
CMD ["sh", "-c", "java -jar /home/sample.jar --spring.profiles.active=$PROFILE"]