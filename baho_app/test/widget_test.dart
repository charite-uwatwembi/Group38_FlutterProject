import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:baho_app/main.dart'; // Ensure this import points to your main app file
import 'package:baho_app/views/landing_view/landing_view.dart';

void main() {
  testWidgets('LandingView has welcome text and a start button', (WidgetTester tester) async {
    // Build the LandingView and trigger a frame.
    await tester.pumpWidget(GetMaterialApp(
      home: LandingView(),
    ));

    // Verify the welcome text is present.
    expect(find.text('Welcome to Baho'), findsOneWidget);

    // Verify the start button is present.
    expect(find.text('Get Started'), findsOneWidget);
  });
}
