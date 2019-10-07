FROM node:10-slim

RUN apk --update add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

RUN mkdir -p /usr/src/node-app/egg-ts-demo

WORKDIR /usr/src/node-app/egg-ts-demo

COPY package.json /usr/src/node-app/egg-ts-demo/package.json

RUN npm i --registry=https://registry.npm.taobao.org

COPY . /usr/src/node-app/egg-ts-demo

EXPOSE 7001

CMD npm start

