# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any necessary dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 3355

# Install dependencies for health check
RUN pip install requests

# Add a health check to ensure the application is running properly
HEALTHCHECK --interval=300s --timeout=30s --start-period=60s --retries=3 \
    CMD python healthcheck.py

# Run the server
CMD ["python", "run_server.py"]
