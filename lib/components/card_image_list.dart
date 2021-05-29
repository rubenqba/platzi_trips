import 'package:flutter/material.dart';
import 'package:platzi_trips/components/card_image.dart';

class CardImageList extends StatelessWidget {
  final List<String> images;

  const CardImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return carrousel();
  }

  Widget carrousel() {
    return Container(
      height: 350,
      child: ListView(
        padding: EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,
        children: images.map((path) => CardImage(path)).toList(),
      ),
    );
  }
}
