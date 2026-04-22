# Etapa 1: Construcción
FROM gradle:jdk21-alpine AS compilacion
WORKDIR /app
COPY . .
# El flag -P evita que Gradle intente descargar otro Java y use el de la imagen
RUN ./gradlew build -x test --no-daemon -Porg.gradle.java.installations.auto-download=false

# Etapa 2: Ejecución
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
# Aquí usamos el nombre "compilacion" que definimos arriba
COPY --from=compilacion /app/build/libs/*-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]