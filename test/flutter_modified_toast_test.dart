import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modified_toast/flutter_modified_toast.dart';

void main() {
  testWidgets('ModifiedToast shows success message',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(
      builder: (context) {
        return ElevatedButton(
          onPressed: () {
            ModifiedToast(
              context: context,
              message: "Success!",
              type: ModifiedToastType.success,
              duration: 1,
            ).show();
          },
          child: Text('Show Toast'),
        );
      },
    ))));

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Success!'), findsOneWidget);
  });

  testWidgets('ModifiedToast shows error message', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Builder(
      builder: (context) {
        return ElevatedButton(
          onPressed: () {
            ModifiedToast(
              context: context,
              message: "Error!",
              type: ModifiedToastType.error,
              duration: 1,
            ).show();
          },
          child: const Text('Show Error Toast'),
        );
      },
    ))));

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Error!'), findsOneWidget);
  });
}
