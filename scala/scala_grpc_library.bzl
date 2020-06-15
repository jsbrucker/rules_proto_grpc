load("//scala:scala_grpc_compile.bzl", "scala_grpc_compile")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library")

def scala_grpc_library(**kwargs):
    # Compile protos
    name_pb = kwargs.get("name") + "_pb"
    scala_grpc_compile(
        name = name_pb,
        **{k: v for (k, v) in kwargs.items() if k in ("deps", "verbose")} # Forward args
    )

    scala_deps = []
    if "extra_deps" in kwargs:
        extra_deps = kwargs.get("extra_deps")
    # Create scala library
    scala_library(
        name = kwargs.get("name"),
        srcs = [name_pb],
        deps = GRPC_DEPS + extra_deps,
        exports = GRPC_DEPS,
        visibility = kwargs.get("visibility"),
    )

GRPC_DEPS = [
    "@scalapb_runtime//jar",
    "@scalapb_runtime_grpc//jar",
    "@scalapb_lenses//jar",
    "@com_google_protobuf//:protobuf_java",
    "@com_google_guava_guava//jar",
    "@3rdparty//3rdparty/jvm/com/lightbend/akka/grpc:akka_grpc_runtime",
    "@3rdparty//3rdparty/jvm/com/typesafe/akka:akka_actor",
    "@3rdparty//3rdparty/jvm/com/typesafe/akka:akka_stream",
    "@3rdparty//3rdparty/jvm/com/typesafe/akka:akka_http",
    "@3rdparty//3rdparty/jvm/com/typesafe/akka:akka_http_core",
    "@io_grpc_grpc_java//core",
]
