# Build the test image
# Tests will be ran within a container from this image
test-runner: Dockerfile
	docker build -t $(TEST_RUNNER_IMAGE_NAME) -f Dockerfile .

# The name to give to the test image
TEST_RUNNER_IMAGE_NAME=test-runner

DOCKER_DIR=/home/app
# Launches a shell within a container from the test image
test-runner-shell: test-runner
	docker run -it --rm -v $(CURDIR):$(DOCKER_DIR) -w $(DOCKER_DIR) $(TEST_RUNNER_IMAGE_NAME)

RUN_TEST=docker run -v $(CURDIR):$(DOCKER_DIR) -w $(DOCKER_DIR) --entrypoint cram $(TEST_RUNNER_IMAGE_NAME) --shell /bin/bash

# <folder>-tests run cram tests defined by .t files in <folder> and fails if there is a difference
%-tests:
	$(RUN_TEST) $*

# <folder>-update run cram tests defined by .t <folder> and updates them with the output.
# You can then commit the changes if they correspond to the intended behaviour changes :D
%-update:
	$(RUN_TEST) --yes --interactive $*

include make/help.mk
