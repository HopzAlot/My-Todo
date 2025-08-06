#!/bin/bash
set -e  # Exit on first error

echo "Installing Python 3 and pip..."
sudo yum update -y
sudo yum install -y python3 python3-pip

# Ensure the base project directory exists
mkdir -p /home/ec2-user/todo

echo "Navigating to project directory..."
cd /home/ec2-user/todo/backend

echo "Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

echo "Upgrading pip..."
pip install --upgrade pip

echo "Installing dependencies..."
pip install -r requirements.txt

echo "✅ install_dependencies.sh completed successfully."