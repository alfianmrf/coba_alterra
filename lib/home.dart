import 'package:coba_alterra/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _classController = TextEditingController();

  DateTime _dateTime = DateTime.now();
  Color _currentColor = Colors.orange;

  List<Map<String, dynamic>> listMap = [
    {
      'nama': 'John Doe',
      'tinggi': 175,
    },
    {
      'nama': 'Lorem Ipsum',
      'tinggi': 160,
    },
  ];

  List<String> data = [];

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  @override
  void dispose() {
    _nameController.dispose();
    _classController.dispose();
    super.dispose();
  }

  void _colorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pick Your Color'),
          content: BlockPicker(
            pickerColor: _currentColor,
            onColorChanged: (color) {
              setState(() {
                _currentColor = color;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void colorPicker2(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: (color) {
                setState(() => pickerColor = color);
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                setState(() => currentColor = pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ini judul'),
          content: const Text('Content dialog'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for(int i=0; i<100; i++)
              const Text('Modal BottomSheet'),
              ElevatedButton(
                child: const Text('Close BottomSheet'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Home'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Isi nama anda',
                      labelText: 'Nama',
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Data tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _classController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.class_),
                      hintText: 'Isi kelas anda',
                      labelText: 'Kelas',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    obscureText: true,
                    obscuringCharacter: '*',
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Data tidak boleh kosong';
                      } else if (value.length<8) {
                        return 'Karakter kurang dari 8';
                      }
                      return null;
                    },
                  ),
                  Image.asset(
                    'assets/images/image.png',
                    height: 100,
                  ),
                  Image.network(
                    'https://www.mindinventory.com/blog/wp-content/uploads/2022/10/flutter-3.png',
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()) {
                        data.add(_nameController.text);
                        data.add(_classController.text);
                      }
                    },
                    child: Text('Submit'),
                  ),
                  Text(DateFormat('dd-MM-yyyy').format(_dateTime)),
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: _currentColor,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _colorPicker(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(_currentColor),
                    ),
                    child: const Text(
                      'Pick Color',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      colorPicker2(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(currentColor),
                    ),
                    child: const Text(
                      'Pick Color 2',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showAlertDialog(context);
                    },
                    child: const Text('Alert Dialog'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showModalBottomSheet(context);
                    },
                    child: const Text('Modal Bottom Sheet'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(content: 'Ini Halaman Detail')));
                    },
                    child: const Text('Go to Detail Page'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          DateTime? selectDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year, DateTime.now().month+1, DateTime.now().day),
          );
          setState((){
            if(selectDate != null) {
              _dateTime = selectDate;
            }
          });
        },
        child: Icon(Icons.date_range),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget with PreferredSizeWidget{
  final String title;
  final bool canBack;

  const AppBarWidget({Key? key, required this.title, this.canBack = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: canBack ? IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ) : null,
      automaticallyImplyLeading: false,
      title: Text(title),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

