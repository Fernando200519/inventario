# Etapa 1: Build con JDK 25
FROM gradle:jdk25 AS build  
WORKDIR /app
COPY . .
RUN chmod +x gradlew
RUN ./gradlew build -x test --no-daemon

# Etapa 2: Runtime con JRE 25
FROM eclipse-temurin:25-jre-alpine 
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]