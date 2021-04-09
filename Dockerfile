FROM node:12-alpine

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN apk add  --no-cache ffmpeg && npm install --production

COPY . .

RUN npm run build

ENV PORT=5000

CMD [ "npm", "start" ]
