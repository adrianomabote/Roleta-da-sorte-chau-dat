# Dockerfile for Render deployment
FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose the port Flask runs on
EXPOSE 5000

# Command to run the application
# Using Gunicorn for production as recommended in replit.md
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
