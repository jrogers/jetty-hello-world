FROM openjdk:8-jre-slim

RUN mkdir -p /usr/app && mkdir /nonexistent
WORKDIR /usr/app

COPY target/application.jar .

# Run as unprivileged
RUN chown -R nobody:nogroup . && chown -R nobody:nogroup /nonexistent
USER nobody

EXPOSE 8080
EXPOSE 9910

CMD ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-XX:-OmitStackTraceInFastThrow", "-Dcom.sun.management.jmxremote", "-Dcom.sun.management.jmxremote.port=9910", "-Dcom.sun.management.jmxremote.rmi.port=9910", "-Dcom.sun.management.jmxremote.ssl=false", "-Dcom.sun.management.jmxremote.authenticate=false", "-Djava.rmi.server.hostname=localhost", "-Djava.security.egd=file:/dev/./urandom", "-jar", "application.jar"]
