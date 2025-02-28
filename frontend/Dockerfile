# Use Node.js 12 as the base image for building the app
FROM node:12 AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps --production=false && npm cache clean --force

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Use Caddy to serve the built files (lighter than Nginx and great for static sites)
FROM caddy:alpine

# Copy the built files from the previous stage
COPY --from=builder /app/dist /usr/share/caddy

# Expose port 80 (HTTP)
EXPOSE 80

# Expose port 443 (HTTPS, optional if Traefik handles HTTPS)
EXPOSE 443
