from django.shortcuts import render,redirect
from django.utils.timezone import now
from .models import Todo
# Create your views here.
def index(REQUEST):
    todos=Todo.objects.order_by('-id')
    return render(REQUEST,'index.html',{"todos":todos})
def create_todo(REQUEST):
    if REQUEST.method =='POST':
        title= REQUEST.POST.get('title')
        description= REQUEST.POST.get('description')
        Todo.objects.create(title=title, description=description)
    return redirect('/')
def completed_todo(REQUEST, todo_id):
    todo= Todo.objects.get(id=todo_id)
    todo.completed=True
    todo.time= now()
    todo.save()
    return redirect('/')
def delete_todo(REQUEST, todo_id):
    todo=Todo.objects.get(id=todo_id)
    todo.delete()
    return redirect('/')
def incomplete_todo(REQUEST,todo_id):
    todo=Todo.objects.get(id=todo_id)
    todo.completed=False
    todo.time= now()
    todo.save()
    return redirect("/")
def edit_todo(REQUEST,todo_id):
    todo=Todo.objects.get(id=todo_id)
    if REQUEST.method =='POST':
        todo.title=REQUEST.POST.get('title')
        todo.description= REQUEST.POST.get('description')
        todo.time= now()
        todo.save()
        return redirect('/')
    
    return render(REQUEST,"edit.html",{"todo": todo})