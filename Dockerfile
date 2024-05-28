FROM python:3.12.3-bullseye
SHELL ["/bin/bash", "-c"]
RUN pip install cram
RUN apt-get update && apt-get install zip
RUN curl -s "https://get.sdkman.io" | bash && source "/root/.sdkman/bin/sdkman-init.sh" && sdk install java 21.0.3-graal && sdk default java 21.0.3-graal

ENTRYPOINT /bin/bash
