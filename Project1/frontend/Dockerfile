# Stage 1: Build the frontend
FROM node AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

ENV VITE_API_PATH=http://35.238.42.194:31101

COPY . .
RUN npm run build

# Stage 2: Serve with NGINX
FROM nginx

# Copy built static files to nginx web root
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 5173

CMD ["nginx", "-g", "daemon off;"]
