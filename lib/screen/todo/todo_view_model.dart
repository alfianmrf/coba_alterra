import 'package:coba_alterra/model/api/todo_api.dart';
import 'package:coba_alterra/model/todo_model.dart';
import 'package:flutter/material.dart';

enum TodoState {
  none,
  loading,
  loaded,
  error,
}

class TodoViewModel extends ChangeNotifier {
  List<Todo> _todos = [];
  TodoState _todoState = TodoState.none;

  List<Todo> get todos => _todos;
  TodoState get todoState => _todoState;

  getTodos() async {
    changeState(TodoState.loading);
    TodoAPI todoAPI = TodoAPI();

    try{
      final t = await todoAPI.getTodos();
      _todos = t;
      changeState(TodoState.loaded);
    } catch(e) {
      changeState(TodoState.error);
    }
  }

  changeState(TodoState state) {
    _todoState = state;
    notifyListeners();
  }
}