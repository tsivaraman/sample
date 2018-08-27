# Build Sample Application Docker File
#FROM maven
FROM maven:alpine
LABEL "maintainer"="Sivaraman"
ENV PROFILE local
WORKDIR /home
ADD . /home/
COPY pom.xml .
RUN mvn install && mv /home/target/sample.jar /home
RUN ls /home

#FROM java:8
FROM openjdk:alpine
WORKDIR /home
RUN rm -rf /home/.m2
#ENTRYPOINT java -jar  /home/sample.jar --spring.profiles.active=$PROFILE
CMD ["sh", "-c", "java -jar /home/sample.jar --spring.profiles.active=$PROFILE"]