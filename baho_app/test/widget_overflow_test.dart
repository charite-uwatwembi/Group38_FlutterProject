import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:baho_app/main.dart'; // Update the import path according to your project structure

void main() {
  testWidgets('MyApp does not overflow on different screen sizes', (WidgetTester tester) async {
    // Define a list of screen sizes to test
    final screenSizes = [
      Size(320, 480),  // Small screen size
      Size(720, 1280), // Medium screen size
      Size(1080, 1920) // Large screen size
    ];

    for (var size in screenSizes) {
      // Set the screen size
      tester.binding.window.physicalSizeTestValue = size;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      // Build the app
      await tester.pumpWidget(const MyApp());

      // Add a delay to ensure everything is rendered
      await tester.pumpAndSettle();

      // Verify that there are no overflow errors
      expect(find.byType(OverflowBar), findsNothing);
    }

    // Clear the screen size after the test
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
  });
}
