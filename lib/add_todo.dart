import 'package:coba_alterra/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah To Do List'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _todoController,
              decoration: const InputDecoration(
                icon: Icon(Icons.list),
                hintText: 'Isi to do list',
                labelText: 'To Do List',
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'Data tidak boleh kosong';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()) {
                  Provider.of<TodoListProvider>(context, listen: false).addTodo({
                    'name': _todoController.text,
                    'status': false,
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
