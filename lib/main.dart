import 'package:coba_alterra/add_todo.dart';
import 'package:coba_alterra/beranda.dart';
import 'package:coba_alterra/form.dart';
import 'package:coba_alterra/login_page.dart';
import 'package:coba_alterra/todo_list_page.dart';
import 'package:coba_alterra/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoListProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String title = '';
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Poppins',
      ),
      home: const LoginPage(),
    );
  }
}

