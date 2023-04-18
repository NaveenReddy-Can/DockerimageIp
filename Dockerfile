FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y nodejs npm

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

ARG DOCKER_USERNAME
ARG DOCKER_PASSWORD

RUN echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
RUN docker build -t naveenreddykb/getip .
RUN docker push naveenreddykb/getip

CMD ["npm", "start"]
