FROM python:3.10-bullseye

COPY pyproject.toml /app/
WORKDIR /app

RUN \
    apt-get update && apt-get install curl -y&& \
    pip3 install poetry && \
    poetry config virtualenvs.path /app && \
    poetry install && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash && \
    . ~/.bashrc && \
    nvm install v18.12.1 && \
    nvm use v18.12.1 && \
    . $(find . -name activate) && \
    rfbrowser init && \
    npx playwright install-deps

