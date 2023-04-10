import 'dart:developer';

import 'package:coba_alterra/todo_list_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose\
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Isi username',
                  labelText: 'Username',
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Username tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.key),
                  hintText: 'Isi password',
                  labelText: 'Password',
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if(_formKey.currentState!.validate()) {
                    setState(() {
                      _isLoading = true;
                    });
                    final dio = Dio();
                    final Response response = await dio.post(
                      'https://dummyjson.com/auth/login',
                      data: {
                        'username': _usernameController.text,
                        'password': _passwordController.text,
                      },
                      options: Options(
                        headers: {
                          Headers.contentTypeHeader: 'application/json',
                        },
                        validateStatus: (_) => true,
                      ),
                    );
                    setState(() {
                      _isLoading = false;
                    });

                    if(response.statusCode == 200) {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        TodoListPage(
                          firstName: response.data['firstName'],
                          lastName: response.data['lastName'],
                        )), (Route<dynamic> route) => false);
                    } else {
                      final snackBar = SnackBar(
                        content: const Text('username / password anda salah'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
                child: Text(_isLoading ? 'Loading' : 'Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
