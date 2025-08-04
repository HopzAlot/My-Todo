#!/bin/bash
echo "Running migrations..."
cd /home/ec2-user/todo/backend
source venv/bin/activate
python manage.py migrate
