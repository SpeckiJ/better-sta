FROM maven:latest as buildstage
WORKDIR /app
COPY . /app/better-sta/

RUN cd better-sta \
    && mvn install

FROM adoptopenjdk/openjdk8:alpine-slim as runstage
COPY --from=buildstage /app/better-sta/target/sta-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
