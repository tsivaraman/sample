# Build Sample Application Docker File
FROM maven:alpine
LABEL "maintainer"="Sivaraman"
ENV PROFILE local
WORKDIR /home/jboss
ADD . /home/jboss/
RUN cd /home/jboss/ && mvn install && mv /home/jboss/target/sample.jar /home

FROM openjdk:alpine
WORKDIR /home
RUN rm -rf /home/.m2 && rm -rf /home/jboss
RUN ls /home
CMD ["sh", "-c", "java -jar /home/sample.jar --spring.profiles.active=$PROFILE"]