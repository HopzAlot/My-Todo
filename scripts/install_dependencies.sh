#!/bin/bash
set -e  # Exit on first error

echo "Updating system packages..."
sudo yum update -y

echo "Installing Python 3.11 and pip..."

# Enable amazon-linux-extras for python3.11 if available (Amazon Linux 2 might have 3.8 or 3.11 depending on updates)
sudo amazon-linux-extras enable python3.11 -y || echo "Amazon Linux Extras python3.11 not found, trying yum install"

# Clean metadata and install Python 3.11
sudo yum clean metadata
sudo yum install -y python3.11 python3.11-venv python3.11-pip

# Confirm python3.11 installed correctly
python3.11 --version

# Navigate to the deployment root directory (one level up from the scripts folder)
DEPLOY_ROOT="$(dirname "$0")/.."
echo "Navigating to project directory at $DEPLOY_ROOT/backend"
cd "$DEPLOY_ROOT/backend"

echo "Creating virtual environment with Python 3.11..."
python3.11 -m venv venv
source venv/bin/activate

echo "Upgrading pip..."
pip install --upgrade pip

echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

echo "install_dependencies.sh completed successfully."
