#!/bin/bash
echo "Installing Python 3 and pip..."
sudo yum update -y
sudo yum install python3 python3-pip -y

echo "Creating virtual environment..."
cd /home/ec2-user/todo/backend
python3 -m venv venv
source venv/bin/activate

echo "Installing requirements..."
pip install -r ../requirements.txt
