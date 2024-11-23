# Sử dụng OpenJDK để chạy file .war
FROM openjdk:17-jdk-slim
WORKDIR /app
# Copy file .war từ thư mục hiện tại vào container
COPY EduCoreSystem-0.0.1-SNAPSHOT.war EduCoreSystem.war
# Mở cổng 8080
EXPOSE 8080
# Chạy ứng dụng Spring Boot
ENTRYPOINT ["java", "-jar", "EduCoreSystem.war"]
