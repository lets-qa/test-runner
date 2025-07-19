# Test Runner Docker Container

This repository provides a Dockerfile for building an ARM-based container
with Ruby 3.2.2 and several testing gems. The container also installs
Chromium so it can be used for headless browsing.

## Building

Build the image using Docker's buildx so the container is built for ARM64:

```bash
docker buildx build --platform linux/arm64 -t test-runner:arm64 .
```

The resulting image contains all gems listed in the `Gemfile` and can be
used to execute tests or scripts that depend on them.

## Running with Local Tests

To execute tests stored on your machine, map the directory containing
your test suite to `/app` inside the container. For example, if your
tests are located in `~/lets-qa/acceptance/`, start the container with:

```bash
docker run -it --rm -v ~/lets-qa/acceptance:/app test-runner:arm64 bash
```

This command launches the container with the current working directory set
to `/app`, where your tests are mounted. From there you can run any
commands you need, such as `bundle exec cucumber` or `bundle exec rspec`.
