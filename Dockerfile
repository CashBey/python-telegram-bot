FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    libssl-dev \
    gcc \
    && apt-get clean

# Install Python dependencies
WORKDIR /app
COPY requirements-dev-all.txt /app/
RUN pip install --upgrade pip setuptools \
    && pip install -r requirements-dev-all.txt

# Copy application files
COPY . /app/

# Command to run your bot
CMD ["python", "bot.py"]
