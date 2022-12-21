FROM node:19 as build-stage

ENV NODE_OPTIONS=--openssl-legacy-provider

COPY package-lock.json ./package-lock.json
COPY package.json ./

# RUN npm install react-scripts

RUN npm install

COPY ./src ./src
COPY ./public ./public

RUN npm run build

FROM nginx

COPY --from=build-stage ./build /var/www/html

RUN chown -R www-data:www-data /var/www/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD [ "nginx", "-g", "daemon off;" ]
