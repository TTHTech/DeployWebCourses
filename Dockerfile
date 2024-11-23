# Sử dụng Amazon Corretto
FROM amazoncorretto:17

# Tạo thư mục làm việc
WORKDIR /app

# Sao chép file .war vào container
COPY ./target/EduCoreSystem-0.0.1-SNAPSHOT.war EduCoreSystem.war

# Mở cổng 8080
EXPOSE 8080

# Chạy ứng dụng Spring Boot
ENTRYPOINT ["java", "-jar", "EduCoreSystem.war"]
