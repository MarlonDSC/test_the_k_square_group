import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_the_k_square_group/locator.dart';
import 'package:test_the_k_square_group/main.dart';
import 'package:test_the_k_square_group/ui/molecules/user_list_tile.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("tap UserListTile and go back", (WidgetTester tester) async {
    setupLocator();

    await tester.pumpWidget(const MyApp());

    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 1));

    // Find the list tile
    Finder userListTile = find.byType(UserListTile).first;
    Finder trailingIconButton = find.descendant(
      of: userListTile,
      matching: find.byIcon(Icons.info_outline),
    );

    // Press the info icon of the list tile
    await tester.tap(trailingIconButton);
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 1));

    // Press the back button
    Finder backButton = find.byType(BackButton);
    await tester.tap(backButton);
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 1));
  });
}
