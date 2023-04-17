import 'package:coba_alterra/model/api/todo_api.dart';
import 'package:coba_alterra/model/todo_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'todo_api_test.mocks.dart';

@GenerateMocks([TodoAPI])
void main() {
  group('TodoAPI', () {
    TodoAPI todoAPI = MockTodoAPI();

    test('get todos data', () async {
      when(todoAPI.getTodos()).thenAnswer(
        (_) async => <Todo>[
          Todo(id: 1, todo: 'Todo', completed: true, userId: 1),
        ]
      );
      var todos = await todoAPI.getTodos();
      expect(todos.isNotEmpty, true);
    });
  });
}