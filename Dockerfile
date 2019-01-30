# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN node --version
RUN npm --version
RUN npm rebuild node-sass
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-app-k8s /usr/share/nginx/html
