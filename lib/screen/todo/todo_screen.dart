import 'package:coba_alterra/model/todo_model.dart';
import 'package:coba_alterra/screen/todo/todo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TodoViewModel>(context, listen: false).getTodos();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Todo Screen'),
  //     ),
  //     body: const Text('Todo Screen'),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);

    if(viewModel.todoState == TodoState.none) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Todo Screen'),
        ),
        body: const Center(child: Text('Data belum di load')),
      );
    } else if(viewModel.todoState == TodoState.loading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Todo Screen'),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    } else if(viewModel.todoState == TodoState.error) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Todo Screen'),
        ),
        body: const Center(child: Text('Terjadi Kesalahan')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Screen'),
      ),
      body: ListView.builder(
        itemCount: viewModel.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                viewModel.todos[index].todo!,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: viewModel.todos[index].completed! ? Colors.grey : null,
                  decoration: viewModel.todos[index].completed! ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
