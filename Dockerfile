# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy everything
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port (App Runner default is 8080)
EXPOSE 8080

# Run the app using Gunicorn + Uvicorn worker
CMD ["gunicorn", "main:app", "-k", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:8080"]
