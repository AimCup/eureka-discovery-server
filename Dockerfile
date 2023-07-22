FROM maven:3.8.3-openjdk-17 AS build
COPY src /acservice/src
COPY pom.xml /acservice
RUN mvn -f /acservice/pom.xml clean package

FROM openjdk:17-alpine
COPY --from=build /acservice/target/*.jar app.jar
EXPOSE 8761
ENTRYPOINT ["java","-jar","/app.jar"]
