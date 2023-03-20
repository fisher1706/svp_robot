FROM python:3.10-alpine

COPY . /app
WORKDIR /app

RUN \
    apk update && apk add nodejs npm && \
    pip3 install poetry && \
    poetry config virtualenvs.path /app && \
    poetry install && \
    source $(find . -name activate) && \
    rfbrowser init
