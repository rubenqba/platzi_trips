import 'package:flutter/material.dart';

class FloatingActionButtonFavorite extends StatefulWidget {
  const FloatingActionButtonFavorite({Key? key}) : super(key: key);

  @override
  _FloatingActionButtonFavoriteState createState() => _FloatingActionButtonFavoriteState();
}

class _FloatingActionButtonFavoriteState extends State<FloatingActionButtonFavorite> {

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xff11da53),
      mini: true,
      tooltip: "add to Favorite",
      onPressed: onPressedFavorite,
      child: Icon(
        _selected ? Icons.favorite : Icons.favorite_border
      ),
    );
  }

  void onPressedFavorite() {
    var action = this._selected ? "removing" : "adding";
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$action favorite...")));
    setState(() {
      _selected = !this._selected;
    });
  }
}
