#!/bin/bash
set -e  # Exit immediately on any error

echo "📦 Installing build tools and required libs..."
sudo yum groupinstall -y "Development Tools"
sudo yum install -y gcc make wget tar bzip2-devel libffi-devel xz-devel zlib-devel \
    sqlite-devel openssl-devel readline-devel

echo "🧱 Installing SQLite 3.39.4 from source..."
cd /usr/local/src
sudo wget https://www.sqlite.org/2022/sqlite-autoconf-3390400.tar.gz
sudo tar xzf sqlite-autoconf-3390400.tar.gz
cd sqlite-autoconf-3390400
sudo ./configure --prefix=/usr/local
sudo make -j$(nproc)
sudo make install

# Make new SQLite available
echo "/usr/local/lib" | sudo tee /etc/ld.so.conf.d/sqlite3.conf
sudo ldconfig

echo "✅ SQLite version: $(sqlite3 --version)"

echo "🐍 Installing Python 3.8.18 from source..."
cd /usr/local/src
sudo wget https://www.python.org/ftp/python/3.8.18/Python-3.8.18.tgz
sudo tar xzf Python-3.8.18.tgz
cd Python-3.8.18
sudo ./configure --enable-optimizations --with-openssl=/usr/include/openssl --prefix=/usr/local
sudo make -j$(nproc)
sudo make altinstall  # Avoids replacing system Python

PYTHON_PATH="/usr/local/bin/python3.8"
PIP_PATH="/usr/local/bin/pip3.8"

echo "🐍 Python version: $($PYTHON_PATH --version)"
echo "📦 Pip version: $($PIP_PATH --version)"
echo "📂 SQLite version in Python: $($PYTHON_PATH -c 'import sqlite3; print(sqlite3.sqlite_version)')"

# Setup Python virtual environment
DEPLOY_ROOT="$(dirname "$0")/.."
echo "📁 Navigating to project at $DEPLOY_ROOT/backend"
cd "$DEPLOY_ROOT/backend"

echo "🌀 Creating venv with Python 3.8.18..."
$PYTHON_PATH -m venv venv
source venv/bin/activate

echo "⬆️ Upgrading pip..."
pip install --upgrade pip

echo "📦 Installing requirements..."
pip install -r requirements.txt

echo "✅ install_dependencies.sh completed successfully!"
