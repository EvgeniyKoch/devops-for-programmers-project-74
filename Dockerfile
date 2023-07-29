FROM node:18-slim

RUN apt-get update && apt-get install -yq \
  build-essential \
  python3

RUN ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /app

COPY app/package.json .
COPY app/package-lock.json .

RUN npm ci

COPY app/ .

CMD ["bash", "-c", "npm run migrate && npx fastify start -a 0.0.0.0 -l info -P app.js"]
