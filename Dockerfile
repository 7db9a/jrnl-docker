FROM python:3.7.6-buster

RUN apt-get update && apt-get install -y \
        vim

RUN pip install jrnl==1.9.8

WORKDIR /jrnl
