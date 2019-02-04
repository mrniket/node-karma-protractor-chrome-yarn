workflow "New workflow" {
  on = "push"
  resolves = ["Push Image"]
}

action "Build Image" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  args = "build -t mrniket/node-karma-protractor-chrome-yarn:test ."
}

action "Docker Registry" {
  uses = "actions/docker/login@c08a5fc9e0286844156fefff2c141072048141f6"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
  needs = ["Build Image"]
}

action "Push Image" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["Docker Registry"]
  args = "push mrniket/node-karma-protractor-chrome-yarn:test"
}
