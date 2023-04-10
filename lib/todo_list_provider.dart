import 'package:flutter/material.dart';

class TodoListProvider extends ChangeNotifier {
  List<Map<String, dynamic>> todoList = [];

  void addTodo(Map<String, dynamic> todo) {
    todoList.add(todo);
    notifyListeners();
  }

  void deleteTodo(int index) {
    todoList.removeAt(index);
    notifyListeners();
  }
}