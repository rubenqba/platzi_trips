import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platzi_trips/components/button_setting_dto.dart';
import 'package:platzi_trips/view/home_view.dart';
import 'package:platzi_trips/view/platzi_trips_android.dart';
import 'package:platzi_trips/view/platzi_trips_cupertino.dart';
import 'package:platzi_trips/view/profile/profile_view.dart';
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

  List<ButtonSettings> _navigationButtons() {
    return [
      ButtonSettings(label: "Home", child: Icon(Icons.home)),
      ButtonSettings(label: "Search", child: Icon(Icons.search)),
      ButtonSettings(label: "Profile", child: Icon(Icons.person)),
    ];
  }
}



