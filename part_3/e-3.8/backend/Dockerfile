FROM --platform=linux/amd64 golang:1.16-alpine AS build
WORKDIR /usr/src/app
ADD https://github.com/docker-hy/material-applications.git ./
WORKDIR /usr/src/app/example-backend
ENV REQUEST_ORIGIN=http://localhost:5000 \
    REDIS_HOST=redis \
    POSTGRES_HOST=postgres
RUN go build \
    && chmod +x server \
    && adduser -D -h /home/appuser appuser

FROM --platform=linux/amd64 golang:1.16-alpine
EXPOSE 8080
COPY --from=build /usr/src/app/example-backend /usr/src/app/example-backend
WORKDIR /usr/src/app/example-backend
ENV REQUEST_ORIGIN=http://localhost:5000 \
    REDIS_HOST=redis \
    POSTGRES_HOST=postgres
RUN adduser -D -h /home/appuser appuser
USER appuser
CMD ./server
# docker build . -t go-server
# docker run -p 8080:8080 go-server
# 1.08GB before
# 922.08 MB after improvements
# 449.52 MB after alpine
# 319.99 MB after multi-stage build
