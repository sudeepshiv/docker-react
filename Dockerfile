FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
run npm build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/ngnix/html

