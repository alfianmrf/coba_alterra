import 'dart:developer';

import 'package:coba_alterra/todo_list_provider.dart';
import 'package:dio/dio.dart';
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
  List<String> todo = [];
  List<bool> completed = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodos();
  }

  getTodos() async {
    final dio = Dio();
    final Response response = await dio.get(
      'https://dummyjson.com/todos',
      options: Options(
        validateStatus: (_) => true,
      ),
    );
    if(response.statusCode == 200){
      response.data['todos'].forEach((element) {
        setState(() {
          todo.add(element['todo']);
          completed.add(element['completed']);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hi, ${widget.firstName} ${widget.lastName}'),
        Expanded(
          child: ListView.builder(
            itemCount: todo.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    todo[index],
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: completed[index] ? Colors.grey : null,
                      decoration: completed[index] ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // Expanded(
        //   child: Consumer<TodoListProvider>(
        //     builder: (BuildContext context, TodoListProvider provider, Widget? child) {
        //       return ListView.builder(
        //         itemCount: provider.todoList.length,
        //         itemBuilder: (BuildContext context, int index) {
        //           return Card(
        //             child: Padding(
        //               padding: const EdgeInsets.all(16),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Text(
        //                     provider.todoList[index]['name'],
        //                     style: TextStyle(
        //                       color: provider.todoList[index]['status'] ? Colors.grey : null,
        //                       decoration: provider.todoList[index]['status'] ? TextDecoration.lineThrough : null,
        //                     ),
        //                   ),
        //                   // Checkbox(
        //                   //   value: todoListProvider.todoList[index]['status'],
        //                   //   onChanged: (bool? value) {
        //                   //     setState(() {
        //                   //       todoListProvider.todoList[index]['status'] = value!;
        //                   //     });
        //                   //   },
        //                   // ),
        //                   IconButton(
        //                     onPressed: () {
        //                       provider.deleteTodo(index);
        //                     },
        //                     icon: const Icon(Icons.delete),
        //                   )
        //                 ],
        //               ),
        //             ),
        //           );
        //         },
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
