FROM docker:26.1.4-cli

RUN apk add --no-cache git

COPY builder.sh .
RUN chmod +x builder.sh

RUN cat builder.sh

ARG GIT_REPO
ARG DOCKER_REPO
ENV GIT_REPO=${GIT_REPO}
ENV DOCKER_REPO=${DOCKER_REPO}

ENTRYPOINT ./builder.sh "$GIT_REPO" "$DOCKER_REPO"
