# Build Sample Application Docker File
#FROM maven
FROM maven:alpine
LABEL "maintainer"="Sivaraman"
ENV PROFILE local
WORKDIR /home/build
ADD . /home/build/
COPY pom.xml .
RUN cd /home/build/ && mvn install && mv /home/build/target/sample.jar /home

#FROM java:8
FROM openjdk:alpine
WORKDIR /home
#RUN ls /home/app
CMD ["sh", "-c", "java -jar /home/sample.jar --spring.profiles.active=$PROFILE"]