#!/bin/bash
set -e  # Exit immediately if any command fails

echo "Running Django migrations..."

# Go to the backend directory
cd /home/ec2-user/todo/backend

# Activate virtual environment
if [ -d "venv" ]; then
  source venv/bin/activate
else
  echo "Virtual environment not found. Exiting."
  exit 1
fi

# Run migrations
python manage.py migrate

echo "Migrations completed successfully."
