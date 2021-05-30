import 'package:flutter/material.dart';
import 'package:platzi_trips/model/user.dart';

class UserDetail extends StatelessWidget {
  final User _user;

  const UserDetail(this._user);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _avatar(context),
        Expanded(child: _detail(context))
      ],
    );
  }

  Widget _avatar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 20,
          left: 20
      ),
      width: 90,
      height: 90,

      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(_user.avatar)
        )
      ),
    );
  }

  Widget _detail(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        left: 20
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _username(context),
          _email(context),
        ],
      ),
    );
  }

  Widget _username(BuildContext context) {
    return Text(
      _user.name,
      style: Theme.of(context).textTheme.headline6!.copyWith(
        color: Colors.white
      )
    );
  }

  Widget _email(BuildContext context) {
    return Text(
      _user.email,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
        color: Colors.white30
      ),
    );
  }

}
