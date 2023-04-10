import 'package:coba_alterra/add_todo.dart';
import 'package:coba_alterra/beranda.dart';
import 'package:coba_alterra/form.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  final String firstName;
  final String lastName;

  const TodoListPage({
    Key? key,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      BerandaPage(
        firstName: widget.firstName,
        lastName: widget.lastName,
      ),
      FormPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List Page'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTodoPage()));
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const AddTodoPage();
                },
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: const Offset(0.0, 0.5), end: Offset.zero);

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                }
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_left),
            label: 'Form',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}