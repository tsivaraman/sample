# Build Sample Application Docker File
FROM maven
#FROM maven:alpine
LABEL "maintainer"="Sivaraman"
ENV PROFILE local
WORKDIR /home/app
ADD . /home/app
COPY pom.xml .
RUN mvn install && mv /root/.m2/repository/com/testorg/learning/sample/0.0.1-SNAPSHOT/sample-0.0.1-SNAPSHOT.jar /home/app/sample.jar
#Installing /home/app/target/sample.jar to /root/.m2/repository/com/testorg/learning/sample/0.0.1-SNAPSHOT/sample-0.0.1-SNAPSHOT.jar
RUN rm -rf /root/.m2

FROM java:8
#FROM openjdk:alpine
WORKDIR /home/app
#RUN ls /home/app
CMD ["sh", "-c", "java -jar /home/sample.jar --spring.profiles.active=$PROFILE"]