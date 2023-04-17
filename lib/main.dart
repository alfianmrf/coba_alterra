import 'package:coba_alterra/add_todo.dart';
import 'package:coba_alterra/beranda.dart';
import 'package:coba_alterra/form.dart';
import 'package:coba_alterra/login_page.dart';
import 'package:coba_alterra/screen/todo/todo_screen.dart';
import 'package:coba_alterra/screen/todo/todo_view_model.dart';
import 'package:coba_alterra/todo_list_page.dart';
import 'package:coba_alterra/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String title = '';
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoListProvider()),
        ChangeNotifierProvider(create: (context) => TodoViewModel()),
      ],
      child: MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          fontFamily: 'Poppins',
        ),
        home: const TodoScreen(),
      ),
    );
  }
}

