# Sử dụng OpenJDK 17
FROM openjdk:17-jdk-slim

# Tạo thư mục làm việc trong container
WORKDIR /app

# Sao chép file .war từ thư mục target vào container
COPY target/EduCoreSystem-0.0.1-SNAPSHOT.war EduCoreSystem.war

# Mở cổng 8080
EXPOSE 8080

# Chạy ứng dụng Spring Boot
ENTRYPOINT ["java", "-jar", "EduCoreSystem.war"]
