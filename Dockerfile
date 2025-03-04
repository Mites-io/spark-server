FROM node:8

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
