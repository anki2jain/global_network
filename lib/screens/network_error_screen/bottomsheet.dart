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
  dialog() {
    return WidgetsBinding.instance.addPostFrameCallback((_) async {
      showBottomSheet<String>(
          context: context,
          builder: (context) => Container(
                height: 20,
                color: Colors.red,
              ));
    });
  }

  @override
  void initState() {
    super.initState();
    // dialog();
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
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: widget.child,
    );
  }
}
