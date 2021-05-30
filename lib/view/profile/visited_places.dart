import 'package:flutter/material.dart';
import 'package:platzi_trips/components/place_detail.dart';
import 'package:platzi_trips/model/hiker_place.dart';

class VisitedPlaces extends StatelessWidget {
  final List<HikerPlace>_places;

  VisitedPlaces(List<HikerPlace>? data) : _places = data != null ? data : List.empty();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 310
      ),
      child: ListView(
        children: _places.map((p) => PlaceCard(data: p,)).toList(),
      ),
    );
  }
}
