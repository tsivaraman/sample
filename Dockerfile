#Sample Application Docker File
FROM openjdk:8-jre-alpine
# FROM java:8 
# Install maven. Since it is alpine based use apk instead of apt-get
RUN apk update
RUN apk install -y maven

LABEL "maintainer"="Sivaraman"
ENV PROFILE local
WORKDIR /home/build
ADD . /home/build/
RUN cd /home/build/ && mvn install && mv /home/build/target/sample.jar /home

WORKDIR /home
RUN rm -rf /home/.m2 && rm -rf /home/build
RUN ls /home
CMD ["sh", "-c", "java -jar /home/sample.jar --spring.profiles.active=$PROFILE"]