# global_network

This package provides a GlobalNetwork widget that can be used to display a network error screen when app in offline mode.

Now you don't need to implement connection checks on different screens just use this package & let the app user know about the connection issues.

# Dependencies

In pubspec.yaml use global_network as dependency to use this package

```yaml
dependencies:
  global_network: <package_version>
```

# How to Use?

- After adding dependency in pubspec.yaml import it

```dart
import 'package:global_network/global_network.dart';

```

- Now you all setup to use this package just wrap your widget with new widget GlobalNetwork in order to display Internet connection error / warning screen.

```dart
GlobalNetwork(
      child: Scaffold(
        appBar: AppBar(title: Text("Global Network")),
        body: Center(child: Text("Network Connection Available")),
      ),
    );
```

- Hurray!!!! You screen is now network sensitive whenver you lost internet connectivity an warning screen will be display.

* Wrap only those widgets where you need to show "connection screen"

# How screen look after using this?

<img src="https://github.com/anki2jain/global_network/tree/master/images/nonetworkscreen.jpeg" width="300" height="500">

# Contributions

### Found any bug? Wants to add or suggest something new ideas ?

- Fork the repo
- Fix the bug / add new features
- Commit your changes to new branch
- Push the changes
- Create a pull request

# Upcoming Features

- Customisable "no connection screen " as per our requirements.
- Able to display bottomsheet inspite of full screen

### Please don't forget to star this repo.

### More star means more support.
