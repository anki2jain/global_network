import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  final int score;

  GameOver({this.score}) : super();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Container(
        width: 200.0,
        height: 200.0,
        color: Color(0xff4d59fa),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              new TextSpan(
                  text: "GAME OVER!\n",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold)),
              new TextSpan(
                  text: "Your Score = $score \n\n",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal)),
              new TextSpan(
                  text: "Tap to play again.",
                  style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))
            ]),
          ),
        ),
      ),
    );
  }
}
