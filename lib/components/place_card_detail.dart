import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:platzi_trips/model/hiker_place.dart';

class PlaceCardDetail extends StatelessWidget {
  static NumberFormat _formatter = NumberFormat("###,###");
  final HikerPlace _item;
  final bool _showFav;
  final EdgeInsetsGeometry? _margin;

  const PlaceCardDetail({Key? key, required HikerPlace data, EdgeInsetsGeometry? margin, bool showFavIcon = false})
      : _item = data, _showFav = showFavIcon, _margin = margin, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      width: double.infinity,
      height: 150,
      child: _showFav ? _cardContentWithFavIcon(context) : _cardContent(context),
    );
  }

  Widget _cardContentWithFavIcon(BuildContext context) {
    return Stack(
      children: [
        _cardContent(context),
        Positioned(
          bottom: 25,
          right: 20,
          child: _favIcon(),
        ),
      ],
    );
  }

  Widget _cardContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 30
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26, offset: Offset.fromDirection(1, 10))],
      ),
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cardInfoTitle(context),
            _cardInfoCategories(context),
            _cardInfoSteps(context)
          ],
        ),
      ),
    );
  }

  Widget _cardInfoTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15
      ),
      child: Text(
        _item.name,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),
      ),
    );
  }

  Widget _cardInfoCategories(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 5,
          left: 15,
          right: 15
      ),
      child: Text(
        _item.categories.join(", "),
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }

  Widget _cardInfoSteps(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 5,
          bottom: 10,
          left: 15,
          right: 15
      ),
      child: Text(
        "Steps ${_formatter.format(_item.steps)}",
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.orangeAccent
        ),
      ),
    );
  }

  Widget _favIcon() {
    var _icon = Icon(
      _item.favorite ? Icons.favorite : Icons.favorite_border,
      color: Colors.white,
      size: 20,
    );
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff11da53),
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26, offset: Offset.fromDirection(1.5, 10))],
      ),
      child: _icon,
    );
  }
}
