FROM node:14 as build-stage

WORKDIR /
COPY package.json .
RUN npm i
COPY . .
EXPOSE 8080
RUN npm run build

FROM nginx as production-stage
RUN mkdir /app
COPY --from=build-stage /dist /app
COPY nginx.conf /etc/nginx/nginx.conf
