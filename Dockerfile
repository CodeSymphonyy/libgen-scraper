# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /code

# Install system dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    iputils-ping \
    redis-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt /code/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django project files into the container
COPY . /code/

# Create and set permissions for log directory
#RUN mkdir -p /code/logs && chmod 755 /code/logs
#RUN touch /code/logs/django.log && chmod 644 /code/logs/django.log

# Collect static files
RUN python manage.py collectstatic --noinput

# Expose the port the app runs on
EXPOSE 8000

# Define command to start the Gunicorn server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "libgen.wsgi:application"]
