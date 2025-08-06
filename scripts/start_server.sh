#!/bin/bash
set -e  # Exit immediately on error

echo "🚀 Starting Django server..."

# Navigate to backend folder relative to the script location
DEPLOY_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$DEPLOY_ROOT/backend"

# Activate virtual environment
if [ -f "venv/bin/activate" ]; then
  source venv/bin/activate
else
  echo "❌ Virtual environment not found. Exiting."
  exit 1
fi

# Show versions for debugging
echo "🐍 Python version: $(python --version)"
echo "🗃️ SQLite version: $(python -c 'import sqlite3; print(sqlite3.sqlite_version)')"

# Kill any existing Django runserver process (optional)
echo "🛑 Killing any existing Django runserver instances..."
pkill -f "manage.py runserver" || echo "ℹ️ No existing server running."

# Start the server in background with nohup
echo "🚦 Launching Django development server..."
nohup python manage.py runserver 0.0.0.0:8000 > output.log 2>&1 &

echo "✅ Django server started successfully on port 8000."
