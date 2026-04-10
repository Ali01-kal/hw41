import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';

import 'package:your_app/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('login → list → add → logout', (tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterText(find.byKey(Key('email')), 'test@mail.com');
    await tester.enterText(find.byKey(Key('password')), '123456');

    await tester.tap(find.byKey(Key('loginBtn')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(Key('addBtn')));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(Key('nameField')), 'Student 1');
    await tester.tap(find.byKey(Key('saveBtn')));
    await tester.pumpAndSettle();

    expect(find.text('Student 1'), findsOneWidget);

    await tester.tap(find.byKey(Key('logoutBtn')));
    await tester.pumpAndSettle();
  });
}