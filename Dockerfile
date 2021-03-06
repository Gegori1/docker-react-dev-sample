# Build phase 
FROM node:16-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

# run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
