import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String content;

  const DetailPage({Key? key, required this.content}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: Center(child: Text(widget.content)),
    );
  }
}


class Car {
  void sebutNama() {

  }
}

mixin Chargable {
  void charge() {

  }
}

mixin Fillable {
  void fill() {

  }
}

class ElectricCar extends Car with ChangeNotifier {

}