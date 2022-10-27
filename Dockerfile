FROM node:16.5 as builder
RUN git clone https://github.com/eosrio/hyperion-history-api.git
WORKDIR /hyperion-history-api
RUN git checkout v3.3.6-2

FROM node:alpine
RUN npm install -g pm2
COPY --from=builder /hyperion-history-api /hyperion-history-api
WORKDIR /hyperion-history-api
RUN npm install --production