FROM --platform=linux/amd64 node:16
EXPOSE 5000
WORKDIR /usr/src/app
ENV REACT_APP_BACKEND_URL=http://localhost:8080
ADD https://github.com/docker-hy/material-applications.git ./
WORKDIR /usr/src/app/example-frontend
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN apt-get install -y nodejs
RUN npm install
RUN npm run build
RUN npm install -g serve
CMD serve -s -l 5000 build
# docker build . -t node-server
# docker run -p 5001:5000 node-server
