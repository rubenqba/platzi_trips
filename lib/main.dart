import 'package:flutter/material.dart';
import 'package:platzi_trips/components/header_appbar.dart';
import 'package:platzi_trips/view/home_view.dart';
import 'package:platzi_trips/view/platzi_trips.dart';
import 'package:platzi_trips/view/platzi_trips_cupertino.dart';
import 'components/card_image.dart';
import 'components/description_place.dart';
import 'model/review_model.dart';
import 'components/gradient_back.dart';
import 'components/review_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlatziTrips()
    );
  }

}
