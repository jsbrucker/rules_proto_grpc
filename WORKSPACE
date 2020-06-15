workspace(name = "rules_proto_grpc")

#
# Toolchains
#
load("//:repositories.bzl", "rules_proto_grpc_toolchains")
rules_proto_grpc_toolchains()


#
# Core
#
load("//:repositories.bzl", "rules_proto_grpc_repos")
rules_proto_grpc_repos()


#
# Android
#
load("//android:repositories.bzl", "android_repos")
android_repos()

load("@io_grpc_grpc_java//:repositories.bzl", "grpc_java_repositories")
grpc_java_repositories(
    omit_bazel_skylib = True,
    omit_com_google_protobuf = True,
    omit_com_google_protobuf_javalite = True,
    omit_net_zlib = True,
)

load("@build_bazel_rules_android//android:sdk_repository.bzl", "android_sdk_repository")
android_sdk_repository(name = "androidsdk")

#
# Android routeguide
#
load("//:repositories.bzl", "rules_jvm_external")
rules_jvm_external()

load("@rules_jvm_external//:defs.bzl", "maven_install")
maven_install(
    name = "maven_android",
    artifacts = [
        "com.android.support:appcompat-v7:28.0.0",
    ],
    # Fail if a checksum file for the artifact is missing in the repository.
    # Falls through "SHA-1" and "MD5". Defaults to True.
    fail_on_missing_checksum = False,
    repositories = [
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)


#
# Closure
#
load("//closure:repositories.bzl", "closure_repos")
closure_repos()

load("@io_bazel_rules_closure//closure:repositories.bzl", "rules_closure_dependencies", "rules_closure_toolchains")
rules_closure_dependencies(
    omit_bazel_skylib = True,
    omit_com_google_protobuf = True,
    omit_zlib = True,
)
rules_closure_toolchains()


#
# C++
#
load("//cpp:repositories.bzl", "cpp_repos")
cpp_repos()

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")
grpc_deps()


#
# C Sharp
#
load("//csharp:repositories.bzl", "csharp_repos")
csharp_repos()

load(
    "@io_bazel_rules_dotnet//dotnet:defs.bzl",
    "core_register_sdk",
    "net_register_sdk",
    "dotnet_register_toolchains",
    "dotnet_repositories",
)

core_version = "v2.2.101"

dotnet_register_toolchains(
    core_version = core_version,
)

core_register_sdk(
    name = "core_sdk_{}".format(core_version),
    core_version = core_version,
)

dotnet_repositories()

load("//csharp/nuget:packages.bzl", nuget_packages = "packages")
nuget_packages()

load("//csharp/nuget:nuget.bzl", "nuget_protobuf_packages")
nuget_protobuf_packages()

load("//csharp/nuget:nuget.bzl", "nuget_grpc_packages")
nuget_grpc_packages()


#
# D
#
load("//d:repositories.bzl", "d_repos")
d_repos()

load("@io_bazel_rules_d//d:d.bzl", "d_repositories")
d_repositories()


#
# Go
#
load("//:repositories.bzl", "bazel_gazelle", "io_bazel_rules_go")
io_bazel_rules_go()
bazel_gazelle()

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
go_rules_dependencies()
go_register_toolchains()

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
gazelle_dependencies()

load("//go:repositories.bzl", "go_repos")
go_repos()


#
# gRPC gateway
#
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
go_rules_dependencies()
go_register_toolchains()

load("//github.com/grpc-ecosystem/grpc-gateway:repositories.bzl", "gateway_repos")
gateway_repos()


#
# gRPC web
#
load("//github.com/grpc/grpc-web:repositories.bzl", "grpc_web_repos")
grpc_web_repos()


#
# Java
#
load("//java:repositories.bzl", "java_repos")
java_repos()

# grpc_java_repositories already called above in android


#
# NodeJS
#
load("//nodejs:repositories.bzl", "nodejs_repos")
nodejs_repos()

load("@build_bazel_rules_nodejs//:defs.bzl", "yarn_install")
yarn_install(
    name = "nodejs_modules",
    package_json = "//nodejs:requirements/package.json",
    yarn_lock = "//nodejs:requirements/yarn.lock",
)


#
# Objective-C
#
load("//objc:repositories.bzl", "objc_repos")
objc_repos()


#
# PHP
#
load("//php:repositories.bzl", "php_repos")
php_repos()


#
# Python
#
load("//python:repositories.bzl", "python_repos")
python_repos()

load("@rules_python//python:repositories.bzl", "py_repositories")
py_repositories()
load("@rules_python//python:pip.bzl", "pip_repositories")
pip_repositories()

load("@rules_python//python:pip.bzl", "pip_import")
pip_import(
    name = "rules_proto_grpc_py2_deps",
    python_interpreter = "python",
    requirements = "//python:requirements.txt",
)

load("@rules_proto_grpc_py2_deps//:requirements.bzl", pip2_install="pip_install")
pip2_install()

pip_import(
    name = "rules_proto_grpc_py3_deps",
    python_interpreter = "python3",
    requirements = "//python:requirements.txt",
)

load("@rules_proto_grpc_py3_deps//:requirements.bzl", pip3_install="pip_install")
pip3_install()


#
# Ruby
#
load("//ruby:repositories.bzl", "ruby_repos")
ruby_repos()

load("@com_github_yugui_rules_ruby//ruby:def.bzl", "ruby_register_toolchains")
ruby_register_toolchains()

load("@com_github_yugui_rules_ruby//ruby/private:bundle.bzl", "bundle_install")
bundle_install(
    name = "rules_proto_grpc_gems",
    gemfile = "//ruby:Gemfile",
    gemfile_lock = "//ruby:Gemfile.lock",
)


#
# Rust
#
load("//rust:repositories.bzl", "rust_repos")
rust_repos()

load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")
rust_repositories()

load("@io_bazel_rules_rust//:workspace.bzl", "bazel_version")
bazel_version(name = "bazel_version")

load("@io_bazel_rules_rust//proto:repositories.bzl", "rust_proto_repositories")
rust_proto_repositories()


#
# Scala
#
load("//scala:repositories.bzl", "scala_repos")
scala_repos()

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")
scala_repositories()

load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")
scala_register_toolchains()

load("@io_bazel_rules_scala//scala_proto:scala_proto.bzl", "scala_proto_repositories")
scala_proto_repositories()

#
# Scala routeguide
#
load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")
#jvm_maven_import_external(
#    name = "com_thesamet_scalapb_scalapb_json4s",
#    artifact = "com.thesamet.scalapb:scalapb-json4s_2.12:0.7.1",
#    artifact_sha256 = "6c8771714329464e03104b6851bfdc3e2e4967276e1a9bd2c87c3b5a6d9c53c7",
#    server_urls = ["https://repo.maven.apache.org/maven2"],
#)

jvm_maven_import_external(
    name = "org_json4s_json4s_jackson_2_12",
    artifact = "org.json4s:json4s-jackson_2.12:3.6.1",
    artifact_sha256 = "83b854a39e69f022ad3d7dd3da664623252dc822ed4ed1117304f39115c88043",
    server_urls = ["https://repo.maven.apache.org/maven2"],
)

jvm_maven_import_external(
    name = "org_json4s_json4s_core_2_12",
    artifact = "org.json4s:json4s-core_2.12:3.6.1",
    artifact_sha256 = "e0f481509429a24e295b30ba64f567bad95e8d978d0882ec74e6dab291fcdac0",
    server_urls = ["https://repo.maven.apache.org/maven2"],
)

jvm_maven_import_external(
    name = "org_json4s_json4s_ast_2_12",
    artifact = "org.json4s:json4s-ast_2.12:3.6.1",
    artifact_sha256 = "39c7de601df28e32eb0c4e3d684ec65bbf2e59af83c6088cda12688d796f7746",
    server_urls = ["https://repo.maven.apache.org/maven2"],
)

jvm_maven_import_external(
    name = "org_json4s_json4s_ast_2_12",
    artifact = "org.json4s:json4s-ast_2.12:3.6.1",
    artifact_sha256 = "39c7de601df28e32eb0c4e3d684ec65bbf2e59af83c6088cda12688d796f7746",
    server_urls = ["https://repo.maven.apache.org/maven2"],
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
akka_grpc_version = "0.7.1"
http_file(
    name = "com_github_akka_akka_gprc",
    urls = ["https://repo1.maven.org/maven2/com/lightbend/akka/grpc/akka-grpc-codegen_2.12/{}/akka-grpc-codegen_2.12-{}-assembly.jar".format (akka_grpc_version, akka_grpc_version)],
    sha256 = "05d4c255141207e92069d07a5540b77cfe78ff4f4ce7fc79d5dd1c04c681c801",
    executable = True,
)

#
# Swift
#
load("//swift:repositories.bzl", "swift_repos")
swift_repos()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)
swift_rules_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)
apple_support_dependencies()


#
# Misc
#
load("//:repositories.bzl", "bazel_gazelle")
bazel_gazelle()

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")
gazelle_dependencies()

go_repository(
    name = "com_github_urfave_cli",
    commit = "44cb242eeb4d76cc813fdc69ba5c4b224677e799",
    importpath = "github.com/urfave/cli",
)
