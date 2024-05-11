test-runner: Dockerfile
	docker build -t test-runner -f Dockerfile .

DOCKER_DIR=/home/app
test-runner-shell: test-runner
	docker run -it --rm -v $(CURDIR):$(DOCKER_DIR) -w $(DOCKER_DIR) test-runner

RUN_TEST=docker run -v $(CURDIR):$(DOCKER_DIR) -w $(DOCKER_DIR) --entrypoint cram test-runner
%-tests:
	$(RUN_TEST) $*
%-update:
	$(RUN_TEST) --yes --interactive $*
