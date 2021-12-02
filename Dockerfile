FROM node:16
WORKDIR /usr/src/app
COPY server/package*.json ./
RUN npm install
COPY server/server.js ./
COPY server/db.js ./
COPY server/gamestate/controller.js ./gamestate/
COPY server/gamestate/queries.js ./gamestate/
COPY server/gamestate/routes.js ./gamestate/
EXPOSE 8880
CMD ["node", "server.js"]
