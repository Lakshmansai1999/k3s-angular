# Stage 1: Build Angular
FROM node:18 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npx ng build --configuration production

# Stage 2: Serve with nginx
FROM nginx:alpine
COPY --from=build /app/dist/sample-app/* /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
