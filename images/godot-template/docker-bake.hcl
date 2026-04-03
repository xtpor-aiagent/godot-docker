
variable "VERSION" {}
variable "REPOSITORY" {}

group "default" {
  targets = ["godot"]
}

target "godot" {
  dockerfile = "Dockerfile"
  context = "."
  platforms = ["linux/amd64", "linux/arm64"]
  args = {
    SOURCE_REPOSITORY = REPOSITORY
    VERSION = VERSION
  }
  tags = ["${REPOSITORY}:${VERSION}-template"]
  output = ["type=image,push=false"]
}
