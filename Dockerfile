FROM python:3.12.3-bullseye
SHELL ["/bin/bash", "-c"]

# Install cram
RUN pip install cram

# Install java
RUN apt-get update && apt-get install zip && apt-get clean
RUN curl -s "https://get.sdkman.io" | bash && source "/root/.sdkman/bin/sdkman-init.sh" && sdk install java 21.0.3-graal && sdk default java 21.0.3-graal

# Install jq
RUN apt-get update && apt-get install -y jq && apt-get clean

ENTRYPOINT /bin/bash
