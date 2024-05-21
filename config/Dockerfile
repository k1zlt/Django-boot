# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Install system dependencies
RUN apt-get update && \
    apt-get install -y gcc libpq-dev python3-dev && \
    apt-get -y install netcat-openbsd postgresql && \
    rm -rf /var/lib/apt/lists/* \
    apt-get clean    

# Install Python dependencies
COPY config/requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Add entrypoint.sh
COPY config/entrypoint.sh /code/
RUN chmod +x /code/entrypoint.sh

# Add the rest of the code
COPY . /code/

# Run entrypoint.sh
ENTRYPOINT ["/code/entrypoint.sh"]  
