FROM clojure:openjdk-8-tools-deps as builder

WORKDIR /home/app

COPY . .
RUN clojure -Sdeps '{:deps {uberdeps {:mvn/version "0.1.7"}}}' \
      -m uberdeps.uberjar --target "target/app.jar"

## -----------------------------------------------------------------------------

FROM openjdk:8-alpine

RUN apk --no-cache add curl \
    && echo "Pulling fnrun-server binary from Github." \
    && curl -sSL https://github.com/tessellator/fnrun-server/releases/download/v0.1.0/fnrun-server > /usr/bin/fnrun-server \
    && chmod +x /usr/bin/fnrun-server \
    && apk del curl

EXPOSE 8080
ENV FUNCTION_COMMAND "java -cp ./app.jar clojure.main -m sample.core"
COPY --from=builder /home/app/target/app.jar .
CMD [ "fnrun-server" ]
