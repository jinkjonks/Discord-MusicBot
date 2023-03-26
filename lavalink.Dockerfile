FROM eclipse-temurin:11
WORKDIR /workdir
ENV LAVALINK_VERSION=3.7.5
RUN curl -sSL https://github.com/freyacodes/Lavalink/releases/download/${LAVALINK_VERSION}/Lavalink.jar > Lavalink.jar
ENTRYPOINT ["java", "-jar", "Lavalink.jar"]