FROM --platform=linux/amd64 node:16
EXPOSE 5000
WORKDIR /usr/src/app
ADD https://github.com/docker-hy/material-applications.git ./
WORKDIR /usr/src/app/example-frontend
ENV REACT_APP_BACKEND_URL=http://localhost:80/api
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash & apt-get install -y nodejs & npm install & npm run build & npm install -g serve & useradd -m appuser
USER appuser
CMD serve -s -l 5000 build
# docker build . -t node-server
# docker run -p 5001:5000 node-server
# 1.42 GB before
# 911.27 MB after
