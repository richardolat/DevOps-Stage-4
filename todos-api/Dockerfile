# Stage 1: Use an official Node.js image to build the app
FROM node:16-slim AS build-stage

# Set environment variables
ENV NODE_ENV=development
ENV PATH /app/node_modules/.bin:$PATH

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) into the container
COPY package*.json ./

# Install the app dependencies (including dev dependencies)
RUN npm install

# Copy the application source code into the container
COPY . .

# Stage 2: Use a smaller image to run the app (for production)
FROM node:16-slim

# Set environment variables
ENV NODE_ENV=production
ENV PATH /app/node_modules/.bin:$PATH

# Set the working directory inside the container
WORKDIR /app

# Copy the installed dependencies and app code from the build-stage
COPY --from=build-stage /app /app

# Expose the port the app will run on (default Express port is 3000)
EXPOSE 3000

# Set the default command to start the API server using nodemon
CMD ["npm", "start"]
