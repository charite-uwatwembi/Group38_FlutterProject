import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:baho_app/main.dart';

void main() {
  testWidgets('MyApp does not overflow on different screen sizes', (WidgetTester tester) async {
    
    final screenSizes = [
      Size(320, 480),
      Size(720, 1280),
      Size(1080, 1920)
    ];

    for (var size in screenSizes) {
      
      tester.binding.window.physicalSizeTestValue = size;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      
      await tester.pumpWidget(MyApp());

      
      await tester.pumpAndSettle();

      
      expect(find.byType(OverflowBar), findsNothing);
    }

    
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
  });
}
