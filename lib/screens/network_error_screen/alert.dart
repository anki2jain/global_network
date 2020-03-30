import 'dart:ui';

import 'package:flutter/material.dart';

// TODO: ALERT CODE

class NoNetworkAlert extends StatefulWidget {
  final Widget child;

  const NoNetworkAlert({Key key, @required this.child}) : super(key: key);
  @override
  _NoNetworkAlertState createState() => _NoNetworkAlertState();
}

class _NoNetworkAlertState extends State<NoNetworkAlert> {
  dialog() {
    return WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: new AlertDialog(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            title: Center(child: new Text("No connection")),
            content: new Text(
              "Check your internet connection to proceed further",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    dialog();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
