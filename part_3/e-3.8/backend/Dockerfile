FROM --platform=linux/amd64 golang:1.16-alpine AS build
WORKDIR /app
ADD https://github.com/docker-hy/material-applications.git .
RUN cd example-backend \
    && go build -o myapp \
    && chmod +x myapp

FROM --platform=linux/amd64 alpine:3.20
WORKDIR /app
COPY --from=build /app/example-backend/myapp .
ENV REQUEST_ORIGIN=http://localhost:5000 \
    REDIS_HOST=redis \
    POSTGRES_HOST=postgres
RUN adduser -D -h /home/appuser appuser
USER appuser
EXPOSE 8080
ENTRYPOINT ["/app/myapp"]
# docker build . -t go-server
# docker run -p 8080:8080 go-server
# 1.08GB before
# 922.08 MB after improvements
# 449.52 MB after alpine
# 25.89 MB after multi-stage build
