import 'package:flutter/material.dart';

class Snake extends StatelessWidget {
  final int index;
  final int score;

  Snake({@required this.index, @required this.score}) : assert(index != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      child: index == 0
          ? Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 2.0,
                    width: 2.0,
                    decoration: BoxDecoration(
                        color: Colors.yellowAccent, shape: BoxShape.circle)),
                Container(
                    height: 2.0,
                    width: 2.0,
                    decoration: BoxDecoration(
                        color: Colors.yellowAccent, shape: BoxShape.circle)),
              ],
            )
          : Container(),
      decoration: new BoxDecoration(
          borderRadius: index == 0
              ? BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0))
              : null,
          shape: BoxShape.rectangle,
          color: Colors.green[700]),
    );
  }
}
