
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
    VERSION = VERSION
  }
  tags = ["${REPOSITORY}:${VERSION}"]
  output = ["type=image,push=false"]
}