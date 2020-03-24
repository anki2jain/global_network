import 'package:flutter/material.dart';
import 'package:global_network/global_network.dart';

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalNetwork(
      child: Scaffold(
        appBar: AppBar(title: Text("Global Network")),
        body: Center(child: Text("Network Connection Available")),
      ),
    );
  }
}
