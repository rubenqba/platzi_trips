import 'package:flutter/material.dart';
import 'package:platzi_trips/model/review_model.dart';
import 'package:platzi_trips/components/review.dart';

class ReviewList extends StatelessWidget {
  final List<ReviewModel> reviews;

  ReviewList(this.reviews);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(header());
    children.addAll(reviews.map((r) => Review(r)).toList());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget header() {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
        left: 20
      ),
      child: Text("All reviews",
        style: TextStyle(
          fontSize: 13,
          color: Colors.black87
        ),
      ),
    );
  }
}

