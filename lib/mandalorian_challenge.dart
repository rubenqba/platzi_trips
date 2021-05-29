import 'package:flutter/material.dart';

class MandalorianChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mandalorian = Container(
      child: Center(
        child: Container(
          child: Center(
            child: Text(
              "This is the way!!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          height: 100,
          width: double.infinity,
          color: Color.fromRGBO(0, 0, 0, 0.5),
        ),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/background.jpg"),
              fit: BoxFit.cover
          )
      ),
    );
    return _mandalorian;
  }

}