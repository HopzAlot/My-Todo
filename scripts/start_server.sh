#!/bin/bash
set -e  # Exit immediately on error

echo "🚀 Starting Django server..."

cd /home/ec2-user/todo/backend

# Activate virtual environment
if [ -d "venv" ]; then
  source venv/bin/activate
else
  echo "Virtual environment not found. Exiting."
  exit 1
fi

# Kill any existing Django runserver process (optional)
echo "Killing any existing Django runserver instances..."
pkill -f "manage.py runserver" || echo "No existing server running."

# Start the server in background with nohup
echo "Launching Django development server..."
nohup python manage.py runserver 0.0.0.0:8000 > output.log 2>&1 &

echo " Django server started successfully on port 8000."