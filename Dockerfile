FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    libssl-dev \
    gcc \
    && apt-get clean

# Upgrade pip and setuptools before installing dependencies
RUN pip install --no-cache-dir --upgrade pip setuptools

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements-dev-all.txt /app/

# Install dependencies from the requirements file
RUN pip install --no-cache-dir -r requirements-dev-all.txt

# Copy the rest of the application files
COPY . /app/

# Set the command to run your bot
CMD ["python", "bot.py"]
