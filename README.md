This README describes the `flutter_modified_toast` package, a Flutter plugin designed to create customizable toast notifications in mobile applications. Below are the suggested sections to complete your README.

## Description

`flutter_modified_toast` is a Flutter package that allows developers to easily display customizable toast notifications in their applications. This package provides a simple API to show messages to users without interrupting their workflow, enhancing user experience.

## Features

- **Customizable Appearance**: Change colors, text styles, and durations to match your app's design.
- **Multiple Toast Types**: Support for different types of toasts (e.g., success, error, info).
- **Positioning Options**: Control where the toast appears on the screen (top, bottom, center).
- **Animation Effects**: Add animations for showing and hiding toasts for a smoother user experience.

## Getting started

### Prerequisites

- Flutter SDK installed on your machine.
- A Flutter project created (you can create one using `flutter create your_project_name`).

### Installation

Add `flutter_modified_toast` to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_modified_toast: ^1.0.0
```

Run the following command to install the package:

```bash
flutter pub get
```

## Usage

Here’s a simple example of how to use `flutter_modified_toast` in your Flutter application:

```dart
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_modified_toast/flutter_modified_toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToastDemo(),
    );
  }
}

class ToastDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Toast Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showModifiedToast(
                  context: context,
                  message: "Success! Your action was successful.",
                  type: ModifiedToastType.success,
                  backgroundColor: Colors.green,
                  icon: const Icon(Icons.check_circle, color: Colors.white),
                );
              },
              child: const Text('Show Success Toast'),
            ),
            ElevatedButton(
              onPressed: () {
                showModifiedToast(
                  context: context,
                  message: "Error! Something went wrong.",
                  type: ModifiedToastType.error,
                  backgroundColor: Colors.red,
                  icon: const Icon(Icons.error, color: Colors.white),
                );
              },
              child: const Text('Show Error Toast'),
            ),
            ElevatedButton(
              onPressed: () {
                showModifiedToast(
                  context: context,
                  message: "Warning! Check your input.",
                  type: ModifiedToastType.warning,
                  backgroundColor: Colors.orange,
                  icon: const Icon(Icons.warning, color: Colors.white),
                );
              },
              child: const Text('Show Warning Toast'),
            ),
            ElevatedButton(
              onPressed: () {
                showModifiedToast(
                  context: context,
                  message: "Info! Here is some information.",
                  type: ModifiedToastType.info,
                  backgroundColor: Colors.blue,
                  icon: const Icon(Icons.info, color: Colors.white),
                );
              },
              child: const Text('Show Info Toast'),
            ),
            ElevatedButton(
              onPressed: () {
                ModifiedToast(
                  context: context,
                  message: "Action required! Click to proceed.",
                  type: ModifiedToastType.info,
                  duration: 3,
                  icon: const Icon(Icons.info, color: Colors.white),
                  actionLabel: "Proceed",
                  actionCallback: () {
                    print("Action button clicked!");
                  },
                  persistent: true, // This toast will stay until dismissed
                  backgroundImage: 'https://picsum.photos/200/300',
                  borderRadius: BorderRadius.circular(20.0),
                ).show();
              },
              child: const Text('Show Persistent Action Toast'),
            ),
          ],
        ),
      ),
    );
  }

  void showModifiedToast({
    required BuildContext context,
    required String message,
    required ModifiedToastType type,
    required Color backgroundColor,
    Icon? icon,
  }) {
    ModifiedToast(
      position: ModifiedToastPosition.center,
      context: context,
      message: message,
      type: type,
      duration: 2,
      icon: icon,
      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
      dismissOnTap: true,
      backgroundColor: backgroundColor,
      width: 300,
      height: 100,
      borderRadius: BorderRadius.circular(20.0),
      shadowOffset: const Offset(0, 4),
      borderColor: Colors.black,
      borderWidth: 2.0,
      dismissOnSwipe: true,
      onShow: () => print("Toast shown"),
      onDismiss: () => print("Toast dismissed"),
      opacity: 0.9,
      fadeDuration: 0.5,
      slideDistance: 50.0,
      scaleFactor: 1.1,
    ).show();
  }
}

```

## Additional information

For more information about `flutter_modified_toast`, check the following resources:

- **Documentation**: [https://github.com/yashrajjain726/flutter_modified_toast/blob/main/README.md]
- **Issues**: If you find any bugs or have feature requests, please file an issue on [GitHub](https://github.com/yashrajjain726/flutter_modified_toast/issues).

This README provides a comprehensive overview of the `flutter_modified_toast` package, ensuring potential users can quickly understand its capabilities and how to implement it in their projects.
