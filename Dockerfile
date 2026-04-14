# Dockerfile for ToxQsar Application

# Use Python 3.9 as the base image
FROM python:3.9

# Install system dependencies for RDKit
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    libboost-all-dev \
    libpng-dev \
    libjpeg-dev \
    libtiff-dev \
    libxml2-dev \
    libxslt1-dev \
    libmysqlclient-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install RDKit conda package
RUN conda install -c conda-forge rdkit

# Set the working directory
WORKDIR /app

# Copy the requirements file if it exists
COPY requirements.txt .

# Install Python packages
RUN pip install --no-cache-dir Biopython rdkit PubChempy scikit-learn

# Copy the rest of the application code
COPY . .

# Command to run the application
CMD ["python", "your_script.py"]  # Replace 'your_script.py' with the actual entry point script