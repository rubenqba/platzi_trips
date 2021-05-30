import 'package:flutter/material.dart';
import 'package:platzi_trips/components/button_setting_dto.dart';

class ProfileActionBar extends StatelessWidget {

  final List<ButtonSettings> buttons;

  const ProfileActionBar({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buttons.map((settings) => _buildButton(settings)).toList(),
    );
  }

  Widget _buildButton(ButtonSettings settings) {
    // return Container(
    //   // margin: EdgeInsets.all(5),
    //   decoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //       color: settings.backgroundColor
    //   ),
    //   width: settings.width,
    //   height: settings.height,
    //   child: settings.icon,
    // );
    Size? size;
    if (settings.height != null && settings.width != null) {
      size = Size(settings.width!, settings.height!);
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: settings.backgroundColor,
        minimumSize: size,
        shape: CircleBorder()
      ),
      child: settings.child,
      onPressed: () {print("ponchado");},
    );
  }
}
