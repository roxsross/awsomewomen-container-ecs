FROM node:18-alpine
LABEL owner="RoxsRoss"
ENV APP_DIR demo-ecs
RUN apk --no-cache add tzdata
RUN apk update && apk upgrade libssl1.1 libssl3 libcrypto3 zlib
ENV TZ=America/Buenos_Aires
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm i -g npm@8.16.0 && npm install
COPY . .
RUN npm prune --production
RUN npm run build
EXPOSE 3000
CMD ["npm", "start"]