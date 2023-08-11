# Use Maven to build the application
FROM maven:3.6-jdk-11 as builder
WORKDIR /app
COPY . /app
RUN mvn clean package

# Use OpenJDK to run the application
FROM openjdk:11-jre-slim
COPY --from=builder /app/target/*.jar /app.jar
CMD ["java", "-jar", "/app.jar"]
