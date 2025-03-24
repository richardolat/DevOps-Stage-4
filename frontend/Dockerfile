# Stage 1: Build the frontend
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

# Stage 2: Serve the frontend with Node.js and serve
FROM node:16-alpine

# Set the working directory
WORKDIR /app

# Install serve globally and curl
RUN npm install -g serve && apk add --no-cache curl

# Copy the built files from the builder stage
COPY --from=builder /app/dist /app/dist

# Expose port 8080 (custom port for Traefik routing)
EXPOSE 8080

# Start the server
CMD ["serve", "-s", "/app/dist", "-l", "8080"]
