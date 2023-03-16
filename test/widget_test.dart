// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rock_paper_scissor_game/enums/choice.dart';

import 'package:rock_paper_scissor_game/screens/game_screen.dart';
import 'package:rock_paper_scissor_game/screens/result_screen.dart';

void main() {
  testWidgets('Test to see play again button is in widget tree ',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
        home: ResultScreen(
      userChoice: Choice.paper,
      score: 0,
    )));

    await tester.pump(const Duration(seconds: 2));


    // Verify that user choice is in the widget tree.
    expect(find.byKey(const ValueKey("user-choice")), findsOneWidget);
  });

  testWidgets('Test to see game pad is in widget tree ',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: GameScreen()));
    await tester.pump();

    // Verify that game pad is in the widget tree.
    expect(find.byKey(const Key("game-pad")), findsOneWidget);
  });
  testWidgets('Test to see rules button is in widget tree ',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: GameScreen()));
    await tester.pump();

    // Verify that rules button is in the widget tree.
    expect(find.byKey(const Key("rules-button")), findsOneWidget);
  });
}
