#!/bin/bash
set -e

echo "Updating system packages..."
sudo yum update -y

echo "Installing development tools and dependencies..."
sudo yum groupinstall -y "Development Tools"
sudo yum install -y gcc make wget tar openssl-devel bzip2-devel libffi-devel

echo "Installing Python 3.8 via Amazon Linux Extras..."
sudo amazon-linux-extras enable python3.8
sudo yum clean metadata
sudo yum install -y python38

echo "Installing SQLite 3.39.4 from source..."
cd /tmp
wget https://www.sqlite.org/2022/sqlite-autoconf-3390400.tar.gz
tar -xzf sqlite-autoconf-3390400.tar.gz
cd sqlite-autoconf-3390400
./configure --prefix=/usr/local
make
sudo make install

# Link updated SQLite
echo "/usr/local/lib" | sudo tee /etc/ld.so.conf.d/sqlite3.conf
sudo ldconfig

# Verify version
echo "Installed SQLite version:"
sqlite3 --version

# Now create venv and install Python deps
DEPLOY_ROOT="$(dirname "$0")/.."
cd "$DEPLOY_ROOT/backend"

echo "Creating virtual environment with Python 3.8..."
/usr/bin/python3.8 -m venv venv
source venv/bin/activate

echo "Upgrading pip..."
pip install --upgrade pip

echo "Installing dependencies..."
pip install -r requirements.txt

echo "✅ install_dependencies.sh completed successfully."
