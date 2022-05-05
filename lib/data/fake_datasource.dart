

import 'package:sample/models/todo.dart';

class FakeDataSource { 
  final List<Todo> todos=[
    Todo(content: "test",title: "title",id: 1),
    Todo(content: "test",title: "title",id: 2),
  ];

  Todo createTodo(String title, String content){
    final newTodo =Todo(title: title,content: content,id: todos.length+1);
    todos.add(newTodo);
    return newTodo;
  }
  void deleteTodo(int index){
    todos.removeAt(index);
  }
  List<Todo> fetchAllTodos(){
    return todos;
  }
}