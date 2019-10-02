#1. Создаём приложение
FROM node:alpine as node

#Задаём рабочую папку для следующей инструкции

WORKDIR /app
COPY package.json ./
RUN npm install
#Копируем в контейнер из директории в которой находимся
COPY . .
 
RUN npm run build --prod


#2.ШАГ
FROM nginx:alpine

#Копируем конфиги
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=node /app/dist/my-angular-app /usr/share/nginx/html


EXPOSE 8080

