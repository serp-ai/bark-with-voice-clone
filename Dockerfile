# Copyright (c) Meta, Inc. and its affiliates.
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
FROM ubuntu:22.04

# Installing the required packages
RUN apt update -y
RUN apt install -y git curl
RUN apt install -y python3-pip

WORKDIR /root

COPY . .

# Download the Bark Github repo
RUN git clone https://github.com/luis-furtado/bark-with-voice-clone.git ~/app

RUN cd ~/app

# Install dependencies and dev dependencies to run tests
RUN cd ~/app && \
    pip3 install . && \
    pip3 install -e '.[dev]' 

CMD ["python3", "setup.py", "--help"]