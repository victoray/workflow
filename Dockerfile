FROM node:alpine as builder
WORKDIR /react-app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx:alpine as runner
EXPOSE 80
COPY --from=builder /react-app/build /usr/share/nginx/html/

