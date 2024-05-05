FROM python:3.12.3-bullseye
RUN pip install cram

ENTRYPOINT /bin/bash
