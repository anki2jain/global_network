<img src="https://img.shields.io/badge/developed%20by-ankit--jain-blue">

# global_network

This package provides a GlobalNetwork widget that can be used in an application to display a network error screen during offline mode.

You no longer need to apply connection checks to various screens, just use this package and let the app user know about the connection issues.

# Dependencies

In pubspec.yaml use global_network as dependency to use this package

```yaml
dependencies:
  global_network: <package_version>
```

# How to Use?

- After adding dependency in pubspec.yaml firstly, import the package given below:

```dart
import 'package:global_network/global_network.dart';

```

- Secondly wrap Material App as given:

```dart
  StreamProvider<ConnectivityStatus>(
      create: (BuildContext context) => ConnectivityService().connectionStatusController.stream,

      child: MaterialApp());
```

#### Example-

```dart
  StreamProvider<ConnectivityStatus>(
      create: (BuildContext context) => ConnectivityService().connectionStatusController.stream,

      child: MaterialApp(
           title: 'Global Network',
           theme: ThemeData(
           primarySwatch: Colors.blue,
      ),

      home:  HomePage(),
    ));
```

- Now you are all set to use this package, just wrap your widget with the new widget GlobalNetwork to display the Internet connection error / warning screen.

```dart
GlobalNetwork(
      child: Scaffold(
        appBar: AppBar(title: Text("Global Network")),
        body: Center(child: Text("Network Connection Available")),
      ),
    );
```

- Hurray!!!! Your screen is now network sensitive so whenever you'll lost internet connectivity an warning screen will be display.

* Wrap only those widgets where you need to show "connection error screen"

# How screen look after using this?

<img src="https://raw.githubusercontent.com/anki2jain/global_network/master/images/nonetworkscreen.jpeg" width="300" height="500">

# Contributions

### Found any bug? Wants to add or suggest something new ideas ?

- Fork the repo
- Fix the bug / add new features
- Commit your changes to new branch
- Push the changes
- Create a pull request

# Upcoming Features

- Customisable "warning screen" as per your requirements.
- Will be able to display the Bottlesheet, Alert dialog etc.

### Please don't forget to star the repo (https://github.com/anki2jain/global_network). 

### More star means more support.
