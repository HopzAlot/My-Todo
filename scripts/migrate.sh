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

# Confirm Python + SQLite versions being used
echo "🐍 Python version: $(python --version)"
echo "🗃️ SQLite version: $(python -c 'import sqlite3; print(sqlite3.sqlite_version)')"

# Run Django migrations
python manage.py migrate

echo "✅ Migrations completed successfully."
