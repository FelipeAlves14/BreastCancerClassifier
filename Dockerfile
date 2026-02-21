FROM mcr.microsoft.com/devcontainers/python:3.11-bullseye

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    TF_CPP_MIN_LOG_LEVEL=2 \
    PIP_NO_CACHE_DIR=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    # OpenCV dependencies
    libopencv-dev \
    python3-opencv \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    # General utilities
    git \
    curl \
    wget \
    vim \
    nano \
    htop \
    build-essential \
    # Cleanup
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

# Upgrade pip and install common tools
RUN pip install --upgrade pip setuptools wheel \
    pip install jupyterlab jupyterlab-git jupyter-collaboration \
    jupyter labextension disable "@jupyterlab/apputils-extension:announcements" \ 
    mkdir -p /workspace/csv /workspace/jpeg /workspace/imagensCancerMama /workspace/models

# Set working directory
WORKDIR /workspaces/BreastCancerClassifier

# Expose ports for Jupyter and TensorBoard
EXPOSE 8888 6006

# Default command
CMD ["/bin/bash"]
