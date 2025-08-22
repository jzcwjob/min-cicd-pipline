
#build
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /src
COPY app/pom.xml app/pom.xml
COPY app/src app/src
RUN mvn -f app/pom.xml -q -DskipTests package

# 运行阶段：使用 distroless 降低攻击面
FROM gcr.io/distroless/java17
USER 10001:10001
WORKDIR /app
COPY --from=build /src/app/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]