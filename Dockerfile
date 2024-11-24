# Stage 1: Build the application
FROM maven:3.8.6-openjdk-17 AS build
WORKDIR /app

# Copy only the project definition files
COPY pom.xml .

# Download dependencies and cache them
RUN mvn dependency:go-offline -B

# Copy the source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: Set up the runtime environment
FROM --platform=linux/amd64 amazoncorretto:17 AS runtime
WORKDIR /app

# Copy the built WAR file from the previous stage
COPY --from=build /app/target/EduCoreSystem-0.0.1-SNAPSHOT.war EduCoreSystem.war

# Expose the port on which the application will run
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "EduCoreSystem.war"]
