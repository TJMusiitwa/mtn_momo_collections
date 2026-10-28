import 'package:example/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  for (final brightness in Brightness.values) {
    testWidgets(
      'Playground renders and switches tabs in ${brightness.name} mode',
      (tester) async {
        tester.platformDispatcher.platformBrightnessTestValue = brightness;
        addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);

        await tester.pumpWidget(const MomoSdkPlaygroundApp());
        await tester.pumpAndSettle();

        expect(find.text('1. Sandbox Credentials'), findsOneWidget);
        expect(tester.takeException(), isNull);

        await tester.tap(find.text('Advanced'));
        await tester.pumpAndSettle();
        expect(find.text('Collections Pre-Approval'), findsOneWidget);
        expect(tester.takeException(), isNull);

        await tester.tap(find.text('Simulator'));
        await tester.pumpAndSettle();
        expect(find.text('Run Use Cases Simulator'), findsOneWidget);
        expect(tester.takeException(), isNull);

        await tester.tap(find.text('Core APIs'));
        await tester.pumpAndSettle();
        expect(find.text('1. Sandbox Credentials'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  }
}
