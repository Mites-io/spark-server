FROM docker.io/node:8-buster-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -q --no-allow-insecure-repositories update \
  && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends \
  build-essential git make python3 \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# copy dependency spec and install
COPY package*.json ./
RUN npm install

# copy source code
COPY *.js ./
COPY lib ./lib
COPY views ./views

# expose ports and start
EXPOSE 5683 8080
CMD ["npm", "start"]
