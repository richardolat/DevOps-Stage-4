# Use a base image with Maven and Java pre-installed
FROM maven:3.8.6-openjdk-8 AS build

# Copy the custom settings.xml to override the default Maven configuration
COPY settings.xml /root/.m2/settings.xml

# Copy the application source code
COPY . /app

# Set the working directory
WORKDIR /app

# Build the application (skip tests to speed up the process)
RUN mvn clean package -DskipTests

# Use a lightweight runtime image
FROM openjdk:8-jre-slim

# Copy the built JAR file from the build stage
COPY --from=build /app/target/users-api-0.0.1-SNAPSHOT.jar /app/app.jar

# Expose the port the application runs on
EXPOSE 8084

# Set the entry point to run the application
CMD ["java", "-jar", "/app/app.jar"]
