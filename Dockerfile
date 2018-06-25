FROM openjdk:8-jre-slim

RUN mkdir -p /usr/app && mkdir /nonexistent
WORKDIR /usr/app

COPY target/application.jar .

# Run as unprivileged
RUN chown -R nobody:nogroup . && chown -R nobody:nogroup /nonexistent
USER nobody

EXPOSE 8080

CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "application.jar"]
