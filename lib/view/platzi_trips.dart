import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platzi_trips/view/home_view.dart';
import 'package:platzi_trips/view/platzi_trips_android.dart';
import 'package:platzi_trips/view/platzi_trips_cupertino.dart';
import 'package:platzi_trips/view/profile_view.dart';
import 'package:platzi_trips/view/search_view.dart';

class PlatziTrips extends StatelessWidget {
  const PlatziTrips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return PlatziTripsCupertino(tabs: _tabs(), navigationButtons: _navigationButtons());
    }
    return PlatziTripsAndroid(tabs: _tabs(), navigationButtons: _navigationButtons());
  }

  List<Widget> _tabs() {
    return [HomeView(), SearchView(), ProfileView()];
  }

  List<NavigationButton> _navigationButtons() {
    return [
      NavigationButton("Home1", Icon(Icons.home)),
      NavigationButton("Search1", Icon(Icons.search)),
      NavigationButton("profile1", Icon(Icons.person)),
    ];
  }
}

class NavigationButton {
  final Icon icon;
  final String label;

  NavigationButton(this.label, this.icon);
}


