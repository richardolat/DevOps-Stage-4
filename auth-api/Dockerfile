# Step 1: Build the Go application
FROM golang:1.21.1-alpine AS build

# Set the working directory
WORKDIR /app

# Copy the go mod and sum files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod tidy

# Copy the rest of the Go source code
COPY . .

# Build the Go application
RUN go build -o auth-api

# Step 2: Create the runtime image
FROM alpine:latest

# Install necessary dependencies for running the application
RUN apk --no-cache add ca-certificates

# Set the working directory
WORKDIR /root/

# Copy the compiled Go binary from the build stage
COPY --from=build /app/auth-api .

# Expose the port the application will run on
EXPOSE 8083

# Run the Go application
CMD ["./auth-api"]
