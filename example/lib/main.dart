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
