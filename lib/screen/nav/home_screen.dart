import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Function? onButton1Pressed;
  final Function? onButton2Pressed;
  final Function? onButton3Pressed;

  const HomeScreen({
    this.onButton1Pressed,
    this.onButton2Pressed,
    this.onButton3Pressed,
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: widget.onButton1Pressed as void Function()?,
            child: const Text('Button 1'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: widget.onButton2Pressed as void Function()?,
            child: const Text('Button 2'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: widget.onButton3Pressed as void Function()?,
            child: const Text('Button 3'),
          ),
        ),
      ],
    );
  }
}
