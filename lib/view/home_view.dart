import 'package:flutter/material.dart';
import 'package:platzi_trips/components/description_place.dart';
import 'package:platzi_trips/components/popular_header_appbar.dart';
import 'package:platzi_trips/components/review_list.dart';
import 'package:platzi_trips/model/model_utils.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            DescriptionPlace("Bahamas", 4, ModelUtils.locationDescription()),
            ReviewList(ModelUtils.reviews())
          ],
        ),
        _appbar()
      ],
    );
  }

  Widget _appbar() {
    return PopularHeaderAppbar();
  }
}
