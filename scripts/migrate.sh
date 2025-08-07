#!/bin/bash
set -e  # Exit immediately if any command fails

echo "🔧 Running Django migrations..."

# Resolve the backend directory relative to this script
DEPLOY_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$DEPLOY_ROOT/backend"

# Activate the virtual environment
if [ -f "venv/bin/activate" ]; then
  source venv/bin/activate
else
  echo "❌ Virtual environment not found. Exiting."
  exit 1
fi

# Run Django migrations
python manage.py migrate

echo "✅ Migrations completed successfully."