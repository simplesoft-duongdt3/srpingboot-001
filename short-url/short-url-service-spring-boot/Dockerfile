FROM gradle:7.6.0-jdk17 as builder
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon 

FROM openjdk:17-oracle
COPY --from=builder /home/gradle/src/build/libs/short-url-service-0.0.1-SNAPSHOT.jar short-url-service.jar

# ENTRYPOINT ["java", "-jar", "demo.jar"]
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar short-url-service.jar"]

# docker run -p 9000:9000 -e "JAVA_OPTS=-Dserver.port=9000 -Xmx128m" -e "SPRING_PROFILES_ACTIVE=prod" demo001

# docker run -p 9000:9000 -e "JAVA_OPTS=-Dserver.port=9000 -Xmx128m" demo001
# docker run -p 9000:9000 -e "SPRING_PROFILES_ACTIVE=prod" demo001
# docker run -p 8080:8080 -e "JAVA_OPTS=-Ddebug -Xmx128m" demo001