# Build Sample Application Docker File
FROM maven:alpine
LABEL "maintainer"="Sivaraman"
ENV PROFILE local
WORKDIR /home/jboss
ADD . /home/jboss/
RUN cd /home/jboss/ && mvn install
#mv /home/jboss/target/sample.jar /home
#/home/jboss/target/sample.jar to /root/.m2/repository/com/testorg/learning/sample/0.0.1-SNAPSHOT/sample-0.0.1-SNAPSHOT.jar
RUN pwd
RUN mv sample-0.0.1-SNAPSHOT.jar sample.jar
RUN rm -rf /root/.m2

FROM openjdk:alpine
WORKDIR /deployments
RUN ls /deployments
CMD ["sh", "-c", "java -jar /deployments/sample.jar --spring.profiles.active=$PROFILE"]