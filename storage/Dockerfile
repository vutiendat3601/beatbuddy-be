FROM maven:3.9.6-eclipse-temurin-17 AS layer01
WORKDIR /opt/beatbuddy/
VOLUME [ "/data" ]

COPY . .
COPY ./.m2 /root/.m2
RUN mvn clean install -DskipTests

FROM eclipse-temurin:17-jre-jammy

# Update, upgrade
RUN apt update && apt upgrade -y

# Install ffmpeg
ADD ./dependencies/ffmpeg.tar.gz /opt/ffmpeg
RUN chmod -R u=rx,g=rx,a=rx /opt/ffmpeg

WORKDIR /opt/beatbuddy/
COPY --from=layer01 /opt/beatbuddy/target/beatbuddy-storage-1.0.0.jar ./beatbuddy-storage-1.0.0.jar
COPY --from=layer01 /opt/beatbuddy/entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

ENV PATH=$PATH:/opt/ffmpeg
ENV PROFILE=default
ENTRYPOINT ["/entrypoint.sh"]