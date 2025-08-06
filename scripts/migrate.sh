#!/bin/bash
set -e  # Exit immediately if any command fails

echo "Running Django migrations..."

# Navigate to backend folder relative to the script location
DEPLOY_ROOT="$(dirname "$0")/.."
cd "$DEPLOY_ROOT/backend"

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
