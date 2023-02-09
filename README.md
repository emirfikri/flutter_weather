# weatherapp

➤ The app’s state management, navigation & dependencies management is rely on [Bloc Package](https://pub.dev/packages/bloc).

## Key Features
 - Support Android and iOS
 - Landscape and portrait orientations
 - Temperature units in °C
 - Unit Tests 
 

## Project Architecture
- [Bloc Pattern](https://github.com/felangel/bloc/tree/master/examples)
- Project Structure:
```bash
├── lib
│   ├── blocs (Controller / Business logic)
│   ├── configs (configuration)
│   ├── helpers (styling, reusable constants)
│   ├── models (data models - user, todo)
│   ├── repositories (repository to access datamodels)
│   └──  screens (Screens UI for each page)
│     
└── test
```
## Unit Test

- Simple unit tests are created
- To execute all the unit tests, run
```bash
flutter test   
```



## Setup Project
- Clone repository
```bash
git clone https://github.com/emirfikri/flutter_weather.git
```

- To run the app, simply write
```bash
flutter pub get  
```
```bash
flutter run (Tested working on Android / IOS) (emulator only)
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.