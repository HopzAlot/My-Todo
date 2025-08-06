#!/bin/bash
set -e  # Exit on first error

echo "Updating system packages..."
sudo yum update -y

echo "Installing development tools and gcc..."
sudo yum groupinstall -y "Development Tools"
sudo yum install -y gcc

echo "Enabling python3.8 in amazon-linux-extras..."
sudo amazon-linux-extras enable python3.8 -y
sudo yum clean metadata

echo "Installing Python 3.8 and pip..."
sudo yum install -y python3.8

echo "Installing SQLite 3.38.5 from source..."

cd /tmp
curl -O https://www.sqlite.org/2022/sqlite-autoconf-3380500.tar.gz
tar xzf sqlite-autoconf-3380500.tar.gz
cd sqlite-autoconf-3380500

./configure --prefix=/usr/local
make
sudo make install

echo "/usr/local/lib" | sudo tee /etc/ld.so.conf.d/sqlite3.conf
sudo ldconfig

echo "Installed SQLite version:"
sqlite3 --version

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
