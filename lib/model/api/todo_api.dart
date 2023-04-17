import 'package:coba_alterra/model/todo_model.dart';
import 'package:dio/dio.dart';

class TodoAPI {
  Future<List<Todo>> getTodos() async {
    final Response response = await Dio().get(
      'https://dummyjson.com/todos',
      options: Options(
        validateStatus: (_) => true,
      ),
    );

    // List<Todo> todos = (response.data['todos'] as List).map((e) => Todo(
    //   id: e.id,
    //   todo: e.todo,
    //   completed: e.completed,
    //   userId: e.userId,
    // )).toList();

    List<Todo> todos = List<Todo>.from(response.data['todos'].map((model) => Todo.fromJson(model)));

    return todos;
  }
}