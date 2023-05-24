import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final TabController tabController;

  const MenuScreen({Key? key, required this.tabController}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: const <Widget>[
        Center(
          child: Text("Tab 1"),
        ),
        Center(
          child: Text("Tab 2"),
        ),
        Center(
          child: Text("Tab 3"),
        ),
      ],
    );
  }
}
