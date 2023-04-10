import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  bool bigContainer = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            width: bigContainer ? 200 : 100,
            height: bigContainer ? 200 : 100,
            color: bigContainer ? Colors.green : Colors.cyan,
            duration: const Duration(milliseconds: 300),
          ),
          ElevatedButton(
            onPressed: () {
              setState((){
                bigContainer = !bigContainer;
              });
            },
            child: Text('Toggle'),
          ),
        ],
      ),
    );
  }
}

