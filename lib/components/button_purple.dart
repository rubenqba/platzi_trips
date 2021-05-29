import 'package:flutter/material.dart';

class ButtonPurple extends StatelessWidget {

  final String buttonText;

  const ButtonPurple(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return customButton(() => onTab(context));
  }

  Widget customButton(void Function() buttonAction) {
    return InkWell(
      onTap: buttonAction,
      child: Container(
        margin: EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20
        ),
        height: 50,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              colors: [
                Color(0xff4268d3),
                Color(0xff584cd1),
              ],
              begin: FractionalOffset(02, 0),
              end: FractionalOffset(1, 0.6),
              stops: [0, 0.6],
              tileMode: TileMode.clamp
          ),
        ),
        child: Center(
          child: Text(buttonText,
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Lato",
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

  void onTab(BuildContext context) {
    print("paso");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("working...")));
  }
}
