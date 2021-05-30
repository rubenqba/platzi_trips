import 'package:flutter/material.dart';
import 'package:platzi_trips/model/hiker_place.dart';
import 'package:platzi_trips/model/model_utils.dart';
import 'package:platzi_trips/model/user.dart';
import 'package:platzi_trips/view/profile/backgroud_profile.dart';
import 'package:platzi_trips/view/profile/header_profile.dart';
import 'package:platzi_trips/view/profile/visited_places.dart';

class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _background(),
        _header(),
        _placesList()
      ],
    );
  }

  Widget _background() {
    return BackgroundProfile();
  }

  Widget _header() {
    return FutureBuilder(
      future: ModelUtils.randomUser(),
      builder: _buildHeader,
    );
  }

  Widget _buildHeader(BuildContext context, AsyncSnapshot<User> snapshot) {
    if (snapshot.hasError) {
      return Text(
        "There was an error 😥",
        style: Theme.of(context).textTheme.headline5,
      );
    } else if (snapshot.hasData) {
      return HeaderProfile(user: snapshot.data!);
    }
    return CircularProgressIndicator();
  }

  Widget _placesList() {
    return FutureBuilder(
      future: ModelUtils.hikerPlaces(),
      builder: _buildPlacesList,
    );
  }

  Widget _buildPlacesList(BuildContext context, AsyncSnapshot<List<HikerPlace>> snapshot) {
    if (snapshot.hasError) {
      return Text(
        "There was an error 😥",
        style: Theme.of(context).textTheme.headline5,
      );
    } else if (snapshot.hasData) {
      return VisitedPlaces(snapshot.data);
    }
    return CircularProgressIndicator();
  }
}
