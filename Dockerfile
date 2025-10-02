FROM maven:3.9.9-eclipse-temurin-17

COPY . /opt/app
WORKDIR /opt/app

RUN mvn clean package -DskipTests

CMD ["java", "-jar", "target/app.jar"]