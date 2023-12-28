FROM maven:3.9.6-eclipse-temurin-17 AS layer01
WORKDIR /opt/beatbuddy/

COPY . .
COPY ./.m2 /root/.m2
RUN mvn clean install -DskipTests

FROM eclipse-temurin:17-jre-jammy
# Update, upgrade and install python3
RUN apt update && apt upgrade -y
RUN apt install -y python3

# Install ffmpeg
ADD ./dependencies/ffmpeg.tar.gz /opt/ffmpeg

# Install yt-dlp
COPY ./dependencies/yt /opt/yt-dlp/yt

RUN chmod -R u=rx,g=rx,a=rx /opt/yt-dlp /opt/ffmpeg

WORKDIR /opt/beatbuddy/
COPY --from=layer01 /opt/beatbuddy/target/beatbuddy-api-1.0.0.jar ./beatbuddy-api-1.0.0.jar
COPY --from=layer01 /opt/beatbuddy/entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

ENV PATH=$PATH:/opt/yt-dlp:/opt/ffmpeg
ENV PROFILE=default
ENTRYPOINT ["/entrypoint.sh"]