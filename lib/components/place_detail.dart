import 'package:flutter/material.dart';
import 'package:platzi_trips/components/place_card_detail.dart';
import 'package:platzi_trips/model/hiker_place.dart';

class PlaceCard extends StatelessWidget {
  final HikerPlace _item;

  PlaceCard({required HikerPlace data}) : _item = data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _cardBackground(),
        _cardDetail(context)
      ],
    );
  }
  
  Widget _cardDetail(BuildContext context) {
    return PlaceCardDetail(
      data: _item,
      showFavIcon: true,
      margin: EdgeInsets.only(
        left: 60,
        right: 60,
        top: 200,
      ),
    );
  }

  Widget _cardBackground() {
    return Container(
      margin: EdgeInsets.only(
          top: 5,
          left: 20,
          right: 20
      ),
      height: 250,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12, offset: Offset.fromDirection(1, 10))],
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(_item.image)
          )
      ),
    );
  }

}
