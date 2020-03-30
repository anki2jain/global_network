import 'package:flutter/material.dart';

class NoNetworkModalBottomSheet extends StatefulWidget {
  final Widget child;

  const NoNetworkModalBottomSheet({Key key, @required this.child})
      : super(key: key);
  @override
  _NoNetworkModalBottomSheetState createState() =>
      _NoNetworkModalBottomSheetState();
}

class _NoNetworkModalBottomSheetState extends State<NoNetworkModalBottomSheet> {
  dialog() {
    return WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
          useRootNavigator: true,
          isDismissible: false,
          context: context,
          builder: (context) {
            return Container(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      "assets/nowifi.png",
                      height: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Connection Error! ",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 40, right: 40),
                    child: Text(
                        "We are unable to reach our servers! Connect to internet & try again ",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width / 1.5,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Try Again!",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            );
          });
    });
  }

  bool check = false;
  @override
  void initState() {
    super.initState();

    if (Navigator.canPop(context)) Navigator.pop(context);
    dialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
    );
  }
}
