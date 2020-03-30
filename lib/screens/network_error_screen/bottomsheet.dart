import 'package:flutter/material.dart';
import 'dart:ui';
//     TODO:   BOTTOM SHEET

class NoNetworkBottomSheet extends StatefulWidget {
  final Widget child;

  const NoNetworkBottomSheet({Key key, @required this.child}) : super(key: key);
  @override
  _NoNetworkBottomSheetState createState() => _NoNetworkBottomSheetState();
}

class _NoNetworkBottomSheetState extends State<NoNetworkBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 25,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "No internet!",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: widget.child,
    );
  }
}
