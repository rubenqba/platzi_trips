import 'package:flutter/material.dart';
import 'package:platzi_trips/view/platzi_trips.dart';

class PlatziTripsAndroid extends StatefulWidget {

  final List<Widget> tabs;
  final List<NavigationButton> navigationButtons;

  const PlatziTripsAndroid({Key? key, required this.tabs, required this.navigationButtons}) : super(key: key);

  @override
  _PlatziTripsAndroidState createState() => _PlatziTripsAndroidState(this.tabs, this.navigationButtons);
}

class _PlatziTripsAndroidState extends State<PlatziTripsAndroid> {
  int _selectedTab = 0;
  final List<Widget> _tabs;
  final List<NavigationButton> _navigationButtons;

  _PlatziTripsAndroidState(this._tabs, this._navigationButtons);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        child: BottomNavigationBar(
          selectedItemColor: Colors.indigo,
          currentIndex: _selectedTab,
          onTap: _selectView,
          items: this._navigationButtons.map((b) => BottomNavigationBarItem(icon: b.icon, label: b.label)).toList()
        ),
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
      ),
      body: _showView(),
    );
  }

  Widget _showView() {
    print("android tab change");
    return _tabs[_selectedTab];
  }

  void _selectView(int value) {
    print("tab change");
    setState(() {
      _selectedTab = value;
    });
  }
}