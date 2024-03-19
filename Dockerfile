FROM debian:stable-slim

# Set environment variable to ensure python prints output directly to the terminal and doesn't buffer it
ENV PYTHONUNBUFFERED=1

# install git, Python, pip, and virtualenv
RUN apt update && apt upgrade -y && \
    apt install wget git-all python3-pip python3-venv -y && \
    rm -rf /var/lib/apt/lists/*

# disable pip cache
ENV PIP_NO_CACHE_DIR=1