FROM python:3.8-alpine

WORKDIR /opt/build
COPY Pipfile* ./

RUN apk add build-base libffi-dev openssl-dev python3-dev bash rsync zip unzip npm git && \
    pip install pipenv && \
    npm install -g serverless && npm install -g serverless-python-requirements && \
    pipenv --python 3.8 && pipenv sync && pipenv sync --dev && \
    rm /var/cache/apk/*
