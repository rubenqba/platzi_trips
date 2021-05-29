import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  int stars = 0;
  double fontSize;

  Stars(this.stars, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return showStars(stars);
  }

  Widget star(bool withBorder) {
    return Container(
      margin: EdgeInsets.only(
        // top: 3,
        right: 3,
      ),
      child: Icon(
        withBorder ? Icons.star : Icons.star_border,
        color: Colors.amberAccent,
        size: fontSize,
      ),
    );
  }

  Widget showStars(int number) {
    List<Widget> rowStars = [];
    List<Widget> rowStarsBorder = [];
    List.filled(number, null, growable: false).forEach((i) => rowStars.add(star(true)));
    List.filled((number - 5).abs(), null, growable: false).forEach((i) => rowStars.add(star(false)));
    List<Widget> finalStars = []..addAll(rowStars)..addAll(rowStarsBorder);
    return Container(
      margin: EdgeInsets.only(
        left: 15
      ),
      child: Row(children: finalStars),
    );
  }
}
