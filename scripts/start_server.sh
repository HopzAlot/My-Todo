#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

echo "🚀 Starting Django server..."

# Navigate to backend folder relative to the script location
DEPLOY_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$DEPLOY_ROOT/backend"

# Kill any existing Django runserver processes
echo "🛑 Killing any existing Django runserver instances..."
pkill -f "manage.py runserver" || echo "ℹ️ No existing server running."

# Start the Django development server in the background using nohup
echo "🚦 Launching Django development server..."
nohup python3 manage.py runserver 0.0.0.0:8000 > output.log 2>&1 &

echo "✅ Django server started successfully on port 8000."