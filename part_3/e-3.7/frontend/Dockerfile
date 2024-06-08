FROM --platform=linux/amd64 node:16-alpine
EXPOSE 5000
WORKDIR /usr/src/app
ADD https://github.com/docker-hy/material-applications.git ./
WORKDIR /usr/src/app/example-frontend
ENV REACT_APP_BACKEND_URL=http://localhost:80/api
RUN apk add --no-cache curl npm \
    && npm install \
    && npm run build \
    && npm install -g serve \
    && adduser -D -h /home/appuser appuser
USER appuser
CMD serve -s -l 5000 build
# docker build . -t node-server
# docker run -p 5001:5000 node-server
# 911.27 MB before
# 551.36 MB after
