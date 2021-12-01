FROM node:16
WORKDIR /usr/src/app
COPY server/package*.json ./
RUN npm install
COPY server/server.js ./
EXPOSE 8880
CMD ["node", "server.js"]