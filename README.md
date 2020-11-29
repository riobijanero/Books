# Books

 A cross-platform App that quieries a book data base, displays them in a list and allows a detailed view of each fetched book item.
 To ensure the list elements in the ui are created on demand, the List is displayed using a ListView.builder (https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html)

## Version
1.0

## Software Toolchain

The following are the key tools utilized: 

- Flutter stable, v1.17.3
- Dart 2.8.4
- Xcode 11.5
- Android SDK 29 rev 1

 utilized IDE:
- VS Code

Utilized Git Clients:
- Github
- Fork

## Running the Project

If using the terminal, first ensure that all dependencies are installed:

```sh
$ flutter pub get
```

To ensure a clean build, make sure that all previous builds are removed:

```sh
$ flutter clean
```

To build in debug mode,  run:

```sh
$ flutter run -t lib/main.dart
```

To build in release mode,  run:

```sh
$ flutter run -t lib/main.dart --release
```

for more info on build modes, please see (https://flutter.dev/docs/testing/build-modes)



## State Management

This project uses [Provider](https://pub.dev/packages/provider) as a global state management solution.
 
## Extension Methods 
 
 Under folder lib/common/utils/extensions can be found the extensions files
 that hold the various extension methods.
 
