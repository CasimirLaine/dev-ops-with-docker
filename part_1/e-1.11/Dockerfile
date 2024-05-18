FROM --platform=linux/amd64 amazoncorretto:8
EXPOSE 8080
WORKDIR /usr/src/app
ADD https://github.com/docker-hy/material-applications.git ./
WORKDIR /usr/src/app/spring-example-project
RUN chmod +x mvnw
RUN ./mvnw package
CMD java -jar ./target/docker-example-1.1.3.jar
