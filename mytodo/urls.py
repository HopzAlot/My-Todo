from django.urls import path
from . import views
urlpatterns=[
    path("",views.index,name='index'),
    path("create", views.create_todo, name="create_todo"),
    path("complete/<int:todo_id>", views.completed_todo, name="completed_todo"),
    path("delete/<int:todo_id>", views.delete_todo, name="delete_todo"),
    path("incomplete/<int:todo_id>", views.incomplete_todo, name="incomplete_todo"),
    path("edit/<int:todo_id>", views.edit_todo, name="edit_todo")
]