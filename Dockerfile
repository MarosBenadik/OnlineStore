# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

COPY . /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev

RUN pip install --upgrade pip

RUN ls -la \
  && pip install -r django-source/requirements.txt

# Expose port 8000 for Django development server
EXPOSE 8000

WORKDIR /app/django-source

# Run migrations and start Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
