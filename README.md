# Deepstream Python Bindings

This repository contains a docker build environment that can be used to build the NVIDIA Deepstream Python bindings from [this](https://github.com/NVIDIA-AI-IOT/deepstream_python_apps) repository for Python 3.8.

## Preparing the build environment.

1.  Initialize submodules:
    ```bash
    git submodule update --init --recursive
    ```
2.  Download the Deepstream SDK from https://developer.nvidia.com/deepstream_sdk_v6.0.1_x86_64.tbz2.

3.  Create the build environment image:
    ```bash
    docker build -t deepstream-python-bindings .
    ```

## Building the bindings.

1.  Start the build environment:
    ```bash
    docker run --rm -it -v ${PWD}/deepstream_python_apps:/root/deepstream_python_apps deepstream-python-bindings
    ```

2.  From within the build environment, build the wheel, then exit:
    ```bash
    cd deepstream_python_apps/bindings
    mkdir build
    cd build
    cmake . -DDS_VERSION=6.0 -DPYTHON_MAJOR_VERSION=3 -DPYTHON_MINOR_VERSION=8
    make -j$(nproc)
    exit
    ```

3.  The `deepstream_python_apps/bindings/build/` directory will contain `pyds-1.1.1-py3-none-linux_x86_64.whl`.