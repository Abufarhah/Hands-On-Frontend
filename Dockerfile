FROM node as build
RUN mkdir -p /app
WORKDIR /app
COPY package.json package-lock.json ./
COPY package.json /app
COPY . /app
RUN npm install
RUN npm install -g @angular/cli@6.1.0
RUN ng build --prod
FROM nginx
COPY --from=build /app/dist/demo /usr/share/nginx/html