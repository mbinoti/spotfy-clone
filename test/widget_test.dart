import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:spot/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
