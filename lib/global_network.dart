library global_network;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_network/screens/network_error_screen/nonetwork.dart';
import 'package:provider/provider.dart';

import 'enums/connectivity_status.dart';
import 'services/network_connection.dart';

class GlobalNetwork extends StatelessWidget {
  final Widget child;

  const GlobalNetwork({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
        create: (BuildContext context) =>
            ConnectivityService().connectionStatusController.stream,
        child: NetworkSensitive(
          child: child,
        ));
  }
}
