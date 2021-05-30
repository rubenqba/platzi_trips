import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:platzi_trips/components/button_setting_dto.dart';

class PlatziTripsCupertino extends StatelessWidget {
  final List<Widget> tabs;
  final List<ButtonSettings> navigationButtons;

  const PlatziTripsCupertino({Key? key, required this.tabs, required this.navigationButtons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CupertinoTabScaffold(
          tabBuilder: _showViews,
          tabBar: CupertinoTabBar(
              activeColor: Colors.indigo,
              backgroundColor: Colors.white.withAlpha(50),
              items: this.navigationButtons.map((b) => BottomNavigationBarItem(icon: b.child, label: b.label)).toList()
          ),
        )
    );
  }

  Widget _showViews(BuildContext context, int index) {
    return CupertinoTabView(builder: (context) => this.tabs[index],);
  }
}

