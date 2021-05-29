import 'package:flutter/material.dart';
import 'package:platzi_trips/model/review_model.dart';
import 'package:platzi_trips/components/stars.dart';

class Review extends StatelessWidget {
  final ReviewModel model;

  Review(this.model);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        avatar(model.avatar),
        Expanded(child: review(model))
      ],
    );
  }

  Widget avatar(String path) {
    return Container(
      margin: EdgeInsets.only(
          top: 20,
          left: 20
      ),
      width: 80,
      height: 80,

      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(path)
          )
      ),
    );
  }

  Widget review(ReviewModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        username(data.name),
        details(data.reviews, data.photos.length, data.stars),
        comment(data.comment)
      ],
    );
  }

  Widget username(String name) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20
      ),
      child: Text(name,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 17
        ),
      ),
    );
  }

  Widget details(int comments, int photos, int stars) {
    String reviewStr = comments == 1 ? "1 review" : "$comments reviews";
    String photoStr = photos == 1 ? "1 photo" : "$photos photos";

    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20
      ),
      child: Row(
        children: [
          Text("$reviewStr · $photoStr",
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 13,
                color: Color(0xFFa3a5a7)
            ),
          ),
          new Stars(stars, 13)
        ],
      )
    );
  }

  Widget comment(String text) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20
      ),
      child: Text(text,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 13,
          fontWeight: FontWeight.w900
        ),
      ),
    );
  }
}
