# Use a Python base image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Create and set the working directory
WORKDIR /app

# Copy the requirements file first to install dependencies
COPY requirements-dev-all.txt /app/

# Install dependencies
RUN pip install --upgrade pip setuptools \
    && pip install -r requirements-dev-all.txt

# Copy the rest of the application files into the container
COPY . /app/

# Set the command to run your bot (adjust the entry point as needed)
CMD ["python", "bot.py"]
