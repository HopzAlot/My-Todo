#!/bin/bash
set -e  # Exit on first error

echo "Updating system packages..."
sudo yum update -y

echo "Enabling python3.8 in amazon-linux-extras..."
sudo amazon-linux-extras enable python3.8 -y

echo "Installing Python 3.8 and pip..."
sudo yum clean metadata
sudo yum install -y python3 python3-pip

python3 --version

# Navigate to the deployment root directory (one level up from the scripts folder)
DEPLOY_ROOT="$(dirname "$0")/.."
echo "Navigating to project directory at $DEPLOY_ROOT/backend"
cd "$DEPLOY_ROOT/backend"

echo "Creating virtual environment with Python 3..."
python3 -m venv venv
source venv/bin/activate

echo "Upgrading pip..."
pip install --upgrade pip

echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

echo "✅ install_dependencies.sh completed successfully."
