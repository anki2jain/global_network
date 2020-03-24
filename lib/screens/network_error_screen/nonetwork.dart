import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../enums/connectivity_status.dart';

class Nonetwork extends StatefulWidget {
  @override
  _NonetworkState createState() => _NonetworkState();
}

class _NonetworkState extends State<Nonetwork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "No network please connect to the internet",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class NetworkSensitive extends StatelessWidget {
  final Widget child;

  NetworkSensitive({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.WiFi) {
      return child;
    }

    if (connectionStatus == ConnectivityStatus.Cellular) {
      return child;
    }

    return Nonetwork();
  }
}
