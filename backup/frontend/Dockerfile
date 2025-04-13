# Stage 1: Build the frontend
FROM node AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Serve with NGINX
FROM nginx

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Add custom nginx config
COPY nginx.conf /etc/nginx/conf.d

# Copy built static files to nginx web root
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 5173

CMD ["nginx", "-g", "daemon off;"]
