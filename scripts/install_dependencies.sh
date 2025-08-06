#!/bin/bash
set -e  # Exit on first error

echo "Updating system packages..."
sudo yum update -y

echo "Enabling python3.8 in amazon-linux-extras..."
sudo amazon-linux-extras enable python3.8
sudo yum clean metadata

echo "Installing Python 3.8 and pip..."
sudo yum install -y python3.8 python3.8-venv python3.8-pip

echo "Checking Python version..."
python3.8 --version

# Navigate to the deployment root directory (one level up from the scripts folder)
DEPLOY_ROOT="$(dirname "$0")/.."
echo "Navigating to project directory at $DEPLOY_ROOT/backend"
cd "$DEPLOY_ROOT/backend"

echo "Creating virtual environment with Python 3.8..."
python3.8 -m venv venv
source venv/bin/activate

echo "Upgrading pip..."
pip install --upgrade pip

echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

echo "✅ install_dependencies.sh completed successfully."
