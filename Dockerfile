FROM node:18.18.0
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD ["node", "index.js"]


# FROM node:10-alpine
# RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
# WORKDIR /home/node/app
# COPY package*.json ./
# USER node
# RUN npm install express
# COPY --chown=node:node . .
# EXPOSE 8080
# CMD [ "node", "index.js" ]