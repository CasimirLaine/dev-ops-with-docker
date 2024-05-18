FROM --platform=linux/amd64 golang:1.16
EXPOSE 8080
WORKDIR /usr/src/app
ADD https://github.com/docker-hy/material-applications.git ./
WORKDIR /usr/src/app/example-backend
RUN go build
RUN chmod +x server
CMD ./server
# docker build . -t go-server
# docker run -p 8080:8080 go-server
