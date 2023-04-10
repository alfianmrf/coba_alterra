import 'package:coba_alterra/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BerandaPage extends StatefulWidget {
  final String firstName;
  final String lastName;

  const BerandaPage({
    Key? key,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hi, ${widget.firstName} ${widget.lastName}'),
        Expanded(
          child: Consumer<TodoListProvider>(
            builder: (BuildContext context, TodoListProvider provider, Widget? child) {
              return ListView.builder(
                itemCount: provider.todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            provider.todoList[index]['name'],
                            style: TextStyle(
                              color: provider.todoList[index]['status'] ? Colors.grey : null,
                              decoration: provider.todoList[index]['status'] ? TextDecoration.lineThrough : null,
                            ),
                          ),
                          // Checkbox(
                          //   value: todoListProvider.todoList[index]['status'],
                          //   onChanged: (bool? value) {
                          //     setState(() {
                          //       todoListProvider.todoList[index]['status'] = value!;
                          //     });
                          //   },
                          // ),
                          IconButton(
                            onPressed: () {
                              provider.deleteTodo(index);
                            },
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
