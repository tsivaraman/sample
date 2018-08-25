# Build Sample Application Docker File
FROM maven:alpine
LABEL "maintainer"="Sivaraman"
ENV PROFILE local
WORKDIR /home/build
ADD . /home/build/
RUN cd /home/build/ && mvn install && mv /home/build/target/sample.jar /home

FROM openjdk:alpine
WORKDIR /home
RUN rm -rf /home/.m2 && rm -rf /home/build
RUN ls /home
CMD ["sh", "-c", "java -jar /home/sample.jar --spring.profiles.active=$PROFILE"]