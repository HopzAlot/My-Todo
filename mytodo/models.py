from django.db import models
from datetime import datetime
# Create your models here.
class Todo(models.Model):
    title= models.CharField(max_length=300)
    description= models.TextField()
    completed= models.BooleanField(default=False)
    time=models.DateTimeField(default=datetime.now)