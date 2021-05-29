import 'package:flutter/material.dart';
import 'package:platzi_trips/components/button_purple.dart';
import 'package:platzi_trips/components/stars.dart';

class DescriptionPlace extends StatelessWidget {
  String namePlace;
  int stars;
  String descriptionPlace;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    final title_stars = Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0
          ),
          child: Row(
            children: [
              Text(
                namePlace,
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900
                ),
                textAlign: TextAlign.left,
              ),
              new Stars(stars, 30),
            ],
          )
        ),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title_stars,
        description(),
        actions()
      ],
    );
  }

  Widget actions() {
    return ButtonPurple("Navigate");
  }

  Widget description() {
    return Container(
      margin: EdgeInsets.only(
          top: 15.0,
          left: 20.0,
          right: 20.0
      ),
      child: Text(
        descriptionPlace,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),
      ),
    );
  }
}
