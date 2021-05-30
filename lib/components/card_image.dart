import 'package:flutter/material.dart';
import 'package:platzi_trips/components/floating_action_button.dart';

class CardImage extends StatelessWidget {
  
  final String imagePath;

  CardImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: [
        _card(),
        FloatingActionButtonFavorite()
      ],
    );
  }

  Widget _card() {
    return Container(
      height: 350,
      width: 250,
      margin: EdgeInsets.only(
        top: 80,
        left: 20
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath)
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15,
            offset: Offset(0, 7)
          )
        ]
      ),
    );
  }
}
