// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiplication_game/main.dart';

void main() {
  testWidgets('Multiplication Game basic UI and logic', (WidgetTester tester) async {
    await tester.pumpWidget(const MultiplicationGame());

    // Check for score and question
    expect(find.textContaining('Score:'), findsOneWidget);
    expect(find.textContaining('×'), findsOneWidget);

    // Enter a wrong answer
    await tester.enterText(find.byKey(const Key('answerField')), '0');
    await tester.tap(find.byKey(const Key('checkButton')));
    await tester.pump();
    expect(find.textContaining('❌'), findsOneWidget);

    // Get the current question numbers
    final questionText = tester.widget<Text>(find.textContaining('×')).data!;
    final parts = questionText.split('×');
    final num1 = int.parse(parts[0].trim());
    final num2 = int.parse(parts[1].replaceAll('= ?', '').trim());
    final correct = (num1 * num2).toString();

    // Enter the correct answer
    await tester.enterText(find.byKey(const Key('answerField')), correct);
    await tester.tap(find.byKey(const Key('checkButton')));
    await tester.pump();
    expect(find.textContaining('✅'), findsOneWidget);

    // Tap reset and check score resets
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();
    expect(find.text('Score: 0'), findsOneWidget);
  });
}
