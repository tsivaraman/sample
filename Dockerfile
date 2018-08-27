# Build Sample Application Docker File
FROM maven
#FROM maven:alpine
LABEL "maintainer"="Sivaraman"
ENV PROFILE local
WORKDIR /usr/src/app
ADD . /usr/src/app
COPY pom.xml .
RUN mvn install && mv /root/.m2/repository/com/testorg/learning/sample/0.0.1-SNAPSHOT/sample-0.0.1-SNAPSHOT.jar /usr/src/app/sample.jar
RUN rm -rf /root/.m2

FROM java:8
#FROM openjdk:alpine
WORKDIR /usr/src/app
#RUN ls /usr/src/app
CMD ["sh", "-c", "java -jar /usr/src/app/sample.jar --spring.profiles.active=$PROFILE"]