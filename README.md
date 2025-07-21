# Test Runner Docker Container

This repository provides a Dockerfile for building a container with Ruby
3.2.2 and several testing gems. The container also installs Chromium so it
can be used for headless browsing. The Dockerfile works with multiple
architectures, allowing you to build either ARM64 or AMD64 images.

## Building

Build the image using Docker's buildx. To build for ARM64 run:

```bash
docker buildx build --platform linux/arm64 -t test-runner:arm64 .
```

To build for AMD64 simply change the platform and tag:

```bash
docker buildx build --platform linux/amd64 -t test-runner:amd64 .
```

The resulting image contains all gems listed in the `Gemfile` and can be
used to execute tests or scripts that depend on them.

## Running with Local Tests

To execute tests stored on your machine, map the directory containing
your test suite to `/app` inside the container. For example, if your
tests are located in `~/lets-qa/acceptance/`, start the container with:


```bash
# For an ARM64 image
docker run -it --rm -v ~/lets-qa/acceptance:/app test-runner:arm64 bash

# For an AMD64 image
docker run -it --rm -v ~/lets-qa/acceptance:/app test-runner:amd64 bash
```

This command launches the container with the current working directory set
to `/app`, where your tests are mounted. From there you can run any
commands you need, such as `bundle exec cucumber` or `bundle exec rspec`.


If your tests require an X server, you can prefix the test command with
`xvfb-run` to run them in a virtual framebuffer. For example:

```bash
xvfb-run bundle exec rspec
```

## Testing Watir

You can quickly verify that Watir is working inside the container by running a small script.

```ruby
# test_browser.rb
require 'watir'
browser = Watir::Browser.new(:chrome, headless: true)
browser.goto('https://example.com')
puts browser.title
browser.close
```

Run the script inside the container with:

```bash
bundle exec ruby test_browser.rb
```