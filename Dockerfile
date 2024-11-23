# Build stage
FROM maven:3-openjdk-17 AS build
WORKDIR /app
COPY . .  # Copy toàn bộ mã nguồn vào container
RUN mvn clean package -DskipTests  # Build file .war

# Run stage
FROM openjdk:17-jdk-slim
WORKDIR /app
# Copy file .war từ giai đoạn build
COPY --from=build /app/target/EduCoreSystem-0.0.1-SNAPSHOT.war EduCoreSystem.war
EXPOSE 8080
# Chạy ứng dụng Spring Boot
ENTRYPOINT ["java", "-jar", "EduCoreSystem.war"]
