# fnrun-clj-example

This repository provides an example of how to build a Clojure project that works
with fnrun.

The project uses the [fnrun-clj](https://github.com/tessellator/fnrun-clj)
library to create a function to be executed with
[fnrun](https://github.com/tessellator/fnrun).

The Dockerfile builds the project and runs it using
[fnrun-server](https://github.com/tessellator/fnrun-server). fnrun-server will
launch eight instances of the function (the default value). Each instance will
maintain its own state.

The k8s.yaml file provides an example configuration of how you might deploy
this function to kubernetes using [Knative](https://knative.dev).
