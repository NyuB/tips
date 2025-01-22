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

ifeq ($(OS), Windows_NT)
AWK_AVAILABLE=$(shell where /Q awk && echo yes)
INSTALL_AWK=echo Auto-generated help message requires 'awk', you can install awk from chocolatey: 'choco install awk'
else
AWK_AVAILABLE=$(shell which awk && echo yes)
INSTALL_AWK=echo "Auto-generated help message requires 'awk', you can install awk from your package manager, e.g. 'apt-get install awk'"
endif

# Prints this help message
help:
ifeq (yes, $(AWK_AVAILABLE))
	@awk '\
	/^##/{ print $$0; doc = 0; next }\
	/^#/{ if (doc != 1) { comments = $$0; doc = 1 } else { comments = comments "\n\t" $$0 } next }\
	/^([^=])+[=]/{ if (doc == 1) { print "(variable) " $$0 "\n\t" comments "\n"; doc = 0 } next }\
	/^([^:])+:/{ if (doc == 1) { print $$1 "\n\t" comments "\n"; doc = 0 } next }\
	/./{ doc = 0 }\
	' Makefile
else
	@$(INSTALL_AWK)
endif
