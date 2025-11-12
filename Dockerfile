FROM node:18-alpine AS prod
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --only=production

COPY . .

ENV NODE_ENV=production

RUN addgroup -S nodeapp && adduser -S nodeuser -G nodeapp
USER nodeuser

EXPOSE 5000

CMD ["npm", "start"]
