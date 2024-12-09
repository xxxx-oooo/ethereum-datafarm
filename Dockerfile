FROM python:3.11.10-slim-bullseye
ENV PYTHONUNBUFFERED 1

COPY . /opt/ethereum-datafarm
WORKDIR /opt/ethereum-datafarm

RUN pip install -U pip
RUN pip install setuptools_scm
RUN pip install -r requirements.txt

# cleanup
RUN rm -rf /var/lib/apt/lists/*
RUN pip cache purge

# add user
RUN useradd -s /sbin/nologin -u 1001 -d /opt/ethereum-datafarm datafarm

VOLUME "data/"
