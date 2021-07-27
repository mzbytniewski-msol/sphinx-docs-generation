FROM ubuntu:latest

WORKDIR /workspace
RUN apt update -y
RUN apt install -y      \
    make                \
    python3-pip         
    # python3-sphinx
RUN pip3 install sphinx