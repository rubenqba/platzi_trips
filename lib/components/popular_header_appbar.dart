import 'package:flutter/material.dart';
import 'package:platzi_trips/components/gradient_back.dart';
import 'package:platzi_trips/model/model_utils.dart';
import 'package:platzi_trips/model/review_model.dart';

import 'card_image_list.dart';

class PopularHeaderAppbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBack("Popular"),
        CardImageList(ModelUtils.landscapes()),
      ],
    );
  }
}
