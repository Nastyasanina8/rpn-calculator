FROM ubuntu:22.04

RUN apt update && apt install -y \
    cmake \
    g++ \
    make \
    git \
    libgtest-dev

WORKDIR /app
COPY . .
RUN rm -rf build
RUN cmake -B build
RUN cmake --build build

CMD cd build && ctest --verbose
