import 'package:flutter/material.dart';

class Nonetwork extends StatefulWidget {
  final Widget errorScreen;

  const Nonetwork({Key key, this.errorScreen}) : super(key: key);
  @override
  _NonetworkState createState() => _NonetworkState();
}

class _NonetworkState extends State<Nonetwork> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return widget.errorScreen != null
        ? widget.errorScreen
        : Scaffold(
            body: Center(
              child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.blue,
                        Colors.blue[400],
                        Colors.blue[300],
                        Colors.blue[200]
                      ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          "assets/nowifi.png",
                          width: width / 4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Wake up your connection!",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "We are unable to reach our servers.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
            ),
          );
  }
}
