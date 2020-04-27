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

# How does the screen look like after using this?

<img src="https://raw.githubusercontent.com/anki2jain/global_network/master/images/fullscreen.jpeg" width="300" height="500">

# Full Implementation

This package provides different types of error screens such as alertbox, bottlesheet, botmodel and fullscreen. To use the error screen other than the default, simply pass data to the type argument (example: type: Displaytype.alertbox).

```dart
GlobalNetwork(
      type: Displaytype.alertbox;
      child: Scaffold(
        appBar: AppBar(title: Text("Global Network")),
        body: Center(child: Text("Network Connection Available")),
      ),
    );
```

### You'll get -

<img src="https://raw.githubusercontent.com/anki2jain/global_network/master/images/alertbox.jpeg" width="300" height="500">

### This is how other types look like-

<img src="https://raw.githubusercontent.com/anki2jain/global_network/master/images/bottomsheet.jpeg" width="300" height="500">

<img src="https://raw.githubusercontent.com/anki2jain/global_network/master/images/modal.jpeg" width="300" height="500">

# Contributions

### Found any bug? Wants to add or suggest something new ideas ?

- Fork the repo
- Fix the bug / add new features
- Commit your changes to new branch
- Push the changes
- Create a pull request

# New Features

- Customisable "warning screen" as per your requirements.
- Will be able to display the Bottlesheet, Alert dialog etc.

# Upcoming Features

- Will be able to display the game during offline mode
- Will be able to add some exciting features that will engage the user during offline mode

#### Please don't forget to star the repo ( https://github.com/anki2jain/global_network ).

#### More star means more support.
