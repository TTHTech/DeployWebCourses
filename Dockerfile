# Sử dụng Maven để build dự án
FROM maven:3.8.6-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Sử dụng Amazon Corretto để chạy ứng dụng
FROM amazoncorretto:17
WORKDIR /app
COPY --from=build /app/target/EduCoreSystem-0.0.1-SNAPSHOT.war EduCoreSystem.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "EduCoreSystem.war"]
