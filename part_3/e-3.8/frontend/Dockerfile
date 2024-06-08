FROM --platform=linux/amd64 node:16-alpine AS build
WORKDIR /usr/src/app
ADD https://github.com/docker-hy/material-applications.git ./
WORKDIR /usr/src/app/example-frontend
ENV REACT_APP_BACKEND_URL=http://localhost:80/api
RUN apk add --no-cache curl npm \
    && npm install \
    && npm run build

FROM --platform=linux/amd64 node:16-alpine
EXPOSE 5000
COPY --from=build /usr/src/app/example-frontend /usr/src/app/example-frontend
WORKDIR /usr/src/app/example-frontend
ENV REACT_APP_BACKEND_URL=http://localhost:80/api
RUN npm install -g serve
RUN adduser -D -h /home/appuser appuser
USER appuser
CMD serve -s -l 5000 build
# docker build . -t node-server
# docker run -p 5001:5000 node-server
# 1.42 GB before
# 911.27 MB after improvements
# 551.36 MB after alpine
# 313.55 MB after multi-stage build
