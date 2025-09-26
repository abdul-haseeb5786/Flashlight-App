import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/main.dart';

void main() {
  testWidgets('FlashlightApp loads', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(FlashlightApp());

    // Verify that the appbar text is showing.
    expect(find.text('Flashlight App'), findsOneWidget);
  });
}
