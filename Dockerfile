# ---- build ----
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /src
COPY . .
# Speed up repeat builds
RUN mvn -q -DskipTests package

# ---- run ----
FROM eclipse-temurin:17-jre
# Choreo requires a numeric user
RUN useradd -u 10001 -r appuser
USER 10001
WORKDIR /app
COPY --from=build /src/target/*.jar /app/application.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/application.jar"]
