FROM maven AS build

WORKDIR /home/test

COPY mvn* ./
COPY pom* ./

RUN mvn dependency:resolve

COPY ./src ./src

RUN mvn package

COPY infinite.sh ./

FROM openjdk

COPY --from=build /home/test/target/springboot-backend-0.0.1-SNAPSHOT.jar ./app-test.jar

ENTRYPOINT ["java", "-jar", "app-test.jar"]