#!/bin/bash
set -e  # Exit on first error

echo "Installing Python 3 and pip..."
sudo yum update -y
sudo yum install -y python3 python3-pip

# Navigate to the deployment root directory (one level up from the scripts folder)
DEPLOY_ROOT="$(dirname "$0")/.."
echo "Navigating to project directory at $DEPLOY_ROOT/backend"
cd "$DEPLOY_ROOT/backend"

echo "Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

echo "Upgrading pip..."
pip install --upgrade pip

echo "Installing dependencies..."
pip install -r requirements.txt

echo "✅ install_dependencies.sh completed successfully."
