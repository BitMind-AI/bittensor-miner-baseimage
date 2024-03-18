# Bittensor Miner Base Image

## Overview

The `bittensor-miner-baseimage` is designed to serve as a foundational Docker image for creating miners compatible with various Bittensor subtensors. It encapsulates common dependencies and configurations, making the development of specialized miners more straightforward and consistent.

### Using the Base Image

To use this base image, specify it as the starting point in your Dockerfile for a custom Bittensor miner:

```Dockerfile
FROM bittensor-miner-baseimage:latest
```

Follow with customizations specific to your miner, such as adding environment variables, copying miner code, or installing additional dependencies.

## Customizing for Different Subtensors

This base image includes the general setup required for Bittensor miners. To adapt a miner for specific subtensors, you may need to:

1. **Adjust Configuration**: Set environment variables or use configuration files specific to the subtensor.
2. **Install Additional Dependencies**: Some subtensors may require additional Python packages or system libraries.
3. **Add Custom Code**: Implement subtensor-specific logic in your miner code.

Example customization for a subtensor:

```Dockerfile
# Start from the base image
FROM bittensor-miner-baseimage:latest

# Set environment variables for the subtensor
ENV SUBTENSOR_NETWORK=your_network_name

# Copy your miner code into the image
COPY ./miner /miner

# Install any additional dependencies
RUN . /miner/venv/bin/activate && pip install some-special-package

# Command to run your miner
CMD ["python", "/miner/your_miner_script.py"]
```