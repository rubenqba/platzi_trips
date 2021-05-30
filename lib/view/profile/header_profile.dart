import 'package:flutter/material.dart';
import 'package:platzi_trips/components/button_setting_dto.dart';
import 'package:platzi_trips/components/profile_action_bar.dart';
import 'package:platzi_trips/components/user_detail.dart';
import 'package:platzi_trips/model/model_utils.dart';
import 'package:platzi_trips/model/user.dart';

class HeaderProfile extends StatelessWidget {

  final User user;

  HeaderProfile({Key? key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProfileHeader(),
        _ProfileActions(user: user,)
      ],
    );
  }
}

class _ProfileActions extends StatelessWidget {

  final User user;

  const _ProfileActions({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _avatarBar(),
        _buttonsBar(context)
      ],
    );
  }

  Widget _avatarBar() {
    return UserDetail(user);
  }

  Widget _buttonsBar(BuildContext context) {
    var _outline = Colors.indigo;
    var _background = Colors.white;
    double _small = 40;
    double _big = 60;

    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: ProfileActionBar(buttons: [
        ButtonSettings(child: Icon(Icons.bookmark_border_outlined, color: _outline,), backgroundColor: _background, width: _small, height: _small),
        ButtonSettings(child: Icon(Icons.card_giftcard, color: _outline,), backgroundColor: _background, width: _small, height: _small),
        ButtonSettings(child: Icon(Icons.add, color: _outline, size: _big,), backgroundColor: _background, width: _big, height: _big),
        ButtonSettings(child: Icon(Icons.email_rounded, color: _outline), backgroundColor: _background, width: _small, height: _small),
        ButtonSettings(child: Icon(Icons.person, color: _outline,), backgroundColor: _background, width: _small, height: _small),
      ]),
    );
  }
}


class _ProfileHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _header(context);
  }

  Widget _header(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _title(context)),
        _settings(context)
      ],
    );
  }

  Widget _title(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 60,
        left: 20,
      ),
      child: Text(
        "Profile",
        style: Theme.of(context).textTheme.headline4!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2
        ),
      ),
    );
  }

  Widget _settings(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 60,
          right: 20
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.settings, color: Colors.white60,),
    );
  }
}



