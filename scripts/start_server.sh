#!/bin/bash
echo "Starting Django server..."
cd /home/ec2-user/todo/backend
source venv/bin/activate

# Kill previous runserver if it exists
pkill -f runserver

nohup python manage.py runserver 0.0.0.0:8000 > output.log 2>&1 &
