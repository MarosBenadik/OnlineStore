# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev

# Copy the requirements file
COPY requirements.txt /app/

# Install the dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the Django project files to the container
COPY . /app/

# Expose port 8000 for Django development server
EXPOSE 8000

# Run migrations and start Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
