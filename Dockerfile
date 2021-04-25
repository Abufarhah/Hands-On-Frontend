FROM node as build
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
COPY . /app
RUN npm install
RUN npm run build --prod
FROM nginx
COPY --from=build /app/dist/demo /usr/share/nginx/html