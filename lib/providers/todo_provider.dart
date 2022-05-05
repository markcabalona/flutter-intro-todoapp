import 'package:flutter/material.dart';

import 'package:sample/data/fake_datasource.dart';
import 'package:sample/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> get todos => db.fetchAllTodos();

  final FakeDataSource db;
  TodoProvider({
    required this.db,
  });

  void createTodo(String title, String content) {
    db.createTodo(title, content);
    notifyListeners();
  }

  void deleteTodo(int index) {
    db.deleteTodo(index);
    notifyListeners();
  }
}
