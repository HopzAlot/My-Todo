#!/bin/bash
set -e  # Exit immediately on any error

echo "📦 Installing system packages..."
sudo apt update -y
sudo apt install -y python3 python3-venv python3-pip build-essential

# Navigate to backend folder relative to script location
DEPLOY_ROOT="$(dirname "$0")/.."
echo "📁 Navigating to project at $DEPLOY_ROOT/backend"
cd "$DEPLOY_ROOT/backend"

echo "🌀 Creating virtual environment with system Python..."
python3 -m venv venv
source venv/bin/activate

echo "⬆️ Upgrading pip..."
pip install --upgrade pip

echo "📦 Installing Python requirements..."
pip install -r requirements.txt

echo "📂 Verifying SQLite version bundled with Python..."
python -c "import sqlite3; print(f'SQLite version: {sqlite3.sqlite_version}')"

echo "✅ Dependencies installed successfully!"