import 'package:coba_alterra/screen/nav/home_screen.dart';
import 'package:coba_alterra/screen/nav/menu_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  int index = 0;
  late TabController _tabController;

  final List<Tab> menuTabs = <Tab> [
    const Tab(child: Text('Tab 1')),
    const Tab(child: Text('Tab 2')),
    const Tab(child: Text('Tab 3')),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: menuTabs.length, vsync: this);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomeScreen(
        onButton1Pressed: () {
          setState(() {
            _selectedIndex = 1;
            _tabController.animateTo(0);
          });
        },
        onButton2Pressed: () {
          setState(() {
            _selectedIndex = 1;
            _tabController.animateTo(1);
          });
        },
        onButton3Pressed: () {
          setState(() {
            _selectedIndex = 1;
            _tabController.animateTo(2);
          });
        },
      ),
      const Text(
        'Index 1: Business',
      ),
      const Text(
        'Index 2: School',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        bottom: _selectedIndex == 1 ? TabBar(
          controller: _tabController,
          tabs: menuTabs,
        ) : null,
      ),
      body: Center(
        child: _selectedIndex == 1 ? MenuScreen(tabController: _tabController) : _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
