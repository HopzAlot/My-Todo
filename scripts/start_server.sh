#!/bin/bash
set -e  # Exit on any error

echo "🚀 Starting Django server..."

DEPLOY_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$DEPLOY_ROOT/backend"

sudo chown -R ubuntu:ubuntu /home/ec2-user/todo
sudo chmod -R 755 /home/ec2-user/todo

echo "🛑 Killing any existing Django runserver instances..."
pkill -f "manage.py runserver" || echo "ℹ️ No existing server running."

# Activate virtualenv - adjust path if your venv folder is different
source "$DEPLOY_ROOT/backend/venv/bin/activate"

echo "🚦 Launching Django development server..."
nohup python3 manage.py runserver 0.0.0.0:8000 > output.log 2>&1 &

echo "✅ Django server started successfully on port 8000."
