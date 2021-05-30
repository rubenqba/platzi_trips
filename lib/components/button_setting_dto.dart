import 'package:flutter/material.dart';

class ButtonSettings {
  final Widget child;
  final String? label;
  final Color? backgroundColor;
  final double? width;
  final double? height;

  ButtonSettings({this.label, required this.child, this.backgroundColor, this.width, this.height});
}
